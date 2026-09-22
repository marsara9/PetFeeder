# Device Auth Design Notes (draft, unresolved)

Captured 2026-09-21. This is a design discussion, not a committed plan — revisit
and turn into a real plan doc under `docs/plans/incomplete/` once decided.

## Constraints driving this
- No cloud server, no accounts — matches the project's core design goal.
- API must stay fully documented/open (see [api/openapi.yaml](../api/openapi.yaml))
  so a third party could write a conforming client.
- Feeders live on a normal home LAN (DHCP, WPA2/3, no port forwarding).
- Discovery will be mDNS-based (in progress). No persisted feeder registry on
  the phone — feeders are rediscovered fresh each session (see Plan 02,
  [docs/plans/incomplete/02-feeder-setup-discovery.md](plans/incomplete/02-feeder-setup-discovery.md)).
- Preference: don't store more state than absolutely necessary, on either side,
  but storing *some* minimal state on the device is fine if it's justified.

## Threat model
Not "the internet" — the device is never meant to be internet-reachable (no
port forwarding/DDNS; should be stated as a hard requirement). Realistic
adversary is another device already on the same home Wi-Fi: a compromised
smart-home gadget, IoT malware, a guest, etc.

## Known issues to fix regardless of the auth decision (low priority, deferred
until after migration settles)
- `PUT /settings` currently takes `ssid`/`password` as URL query params —
  move to a request body. Query strings leak into logs/proxies/shell history
  even without TLS.
- `POST /feed` has no rate limit. Unlike a typical web app, abuse here causes
  physical harm (dispensing the whole hopper) — add a firmware-side minimum
  interval / daily cap regardless of what auth model is chosen.
- HTTPS was originally suggested as a priority fix, but see "keypair model"
  below — once requests are signed, TLS's main remaining benefit is response
  confidentiality, not authentication (and a self-signed cert with no CA only
  gives you that much anyway). Deprioritized below the signing scheme.

## Options considered for authentication
1. **No auth, LAN-as-trust-boundary.** Zero extra state, matches how most
   consumer LAN-only IoT gear works (Chromecast, smart plugs). Real gate is
   the Wi-Fi password itself. Weakest protection against other LAN devices.
2. **Device-generated pairing token/PIN**, sent as a header on every request
   after setup. Needs the phone to remember a token — reopens persistence
   question for a small secret instead of a feeder list.
3. **Time-boxed `/settings` changes**: no per-request auth, but only accept
   Wi-Fi-rewrite requests during an explicit setup window (post-boot timer or
   physical button), not at any time from anywhere on the LAN.
4. **Public/private keypair mutual auth (current leading idea, detailed below).**

## Leading design: keypair-based pairing + signed requests
- **Device identity keypair**: ESP32 generates its own long-term keypair at
  first boot, persists it (NVS). Proves "same physical device" over time.
- **Authorized controller pubkey**: a single persisted slot on the device
  holding the public key of the one phone allowed to control it. Populated
  via a claim/pairing step.
- **Phone identity keypair**: generated once per install. Use **ECDSA P-256**
  specifically (not Ed25519) so the private key can live in **Android
  Keystore**, hardware/StrongBox-backed and non-extractable — a real security
  win (private key unreadable even on a rooted phone). ESP32 mbedTLS handles
  P-256 verify natively, no custom crypto needed.
- **Request auth**: sign each request (e.g. header over
  `method + path + timestamp + nonce`), verified against the single stored
  authorized pubkey. Stateless on the device — no session/handshake needed,
  just a P-256 verify per request. Timestamp window + small nonce cache to
  block replay (device already does NTP, so it has real time).
- **Claiming (first pairing) needs a race-condition guard**: TOFU ("first
  pubkey to show up wins") is fine only if also gated by time/physical
  presence — e.g. only accept a claim within N minutes of boot, or only while
  the device is in an explicit setup mode — otherwise another LAN device
  could race to claim a freshly-flashed feeder before the real owner does.
- **Reset**: avoid "just format the SD card" — too blunt (wipes schedule,
  history, Wi-Fi creds too). Prefer a scoped action: hold the physical setup
  button for N seconds → clears just the authorized-pubkey slot and reopens
  the claim window, nothing else. Reset should require physical presence,
  not be callable remotely, so a compromised LAN can't unclaim the feeder.

## Open question / residual tension (unresolved)
True zero phone-side persistence + mDNS discovery means the phone has no way
to detect if a *different* device suddenly answers on the same mDNS name
(spoofed/impersonated feeder) — it would blindly trust whatever responds each
session. Protecting against that requires the phone to remember at least
`feeder-id -> its public key` across sessions, which is a small amount of
state, but state nonetheless, and reopens the "zero persistence" decision at a
smaller scope. Need to decide: accept blind trust of mDNS each session, or
carve out an exception for this specific security-anchor cache (distinct from
a full feeder registry / convenience data).

## Next steps when resuming
- Decide the open question above.
- Draft this into a real plan doc (probably slots in before or alongside
  Plan 02) once decided.
- Update `api/openapi.yaml` with the new security scheme + pairing/claim/reset
  endpoints.
- Firmware side: NVS storage for device keypair + authorized pubkey slot,
  mbedTLS P-256 sign/verify, claim-window + reset-button logic.
- Android side: Keystore-backed P-256 keypair generation, request signing
  interceptor in `FeederApiClientFactory`'s OkHttp stack.

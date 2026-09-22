# Plan 02 — Feeder Setup / Discovery / Management

## Goal
Let a user pair a new feeder to the app and manage the set of feeders they own, providing the real implementation of the `FeederRepository` contract that Plan 01 defines and all other feature plans depend on.

## Dependencies
- Plan 01 (Base App Foundation) must exist first: this plan implements the `FeederRepository` interface it defines.
- No dependency on Plans 03-06; those depend on this plan's output (a working `FeederRepository`), not the other way around.

## Context / firmware reality check
`code2` (the ESP32/ESP-IDF firmware this targets) currently has:
- No mDNS/LAN service discovery of any kind.
- A fixed soft-AP SSID `PetFeeder-Setup` (open network, not per-device-random) that the device raises when it can't connect to configured Wi-Fi.
- No `name`/label field on `/settings` — the device has no concept of a user-facing friendly name.

See the [firmware migration gap ledger](../../firmware-migration-gaps.md) for
the complete parity list. In particular, the firmware follow-up for this plan
should add a device hostname/default identity and mDNS service advertisement;
the Android discovery source and pairing flow should then be updated to use
that contract. The local Room display name remains an app concern unless the
new product contract explicitly makes it device-synchronized.

Because of this, v1 discovery is **manual add-by-IP/hostname**, and the feeder's friendly name is **stored client-side only**, in-memory for the lifetime of the process — it is not synced to or from the device, and it does **not** survive process death (confirmed product decision: losing the paired-feeder list on app restart is acceptable; re-adding a feeder by IP is quick and this avoids any persistence layer for what is otherwise a handful of rows with no relations or queries to speak of). mDNS-based discovery and a device-side name field are tracked as a future firmware improvement, not blocking work for this plan.

## What this plan delivers

### 1. Local feeder registry (in-memory)
- `FeederRepositoryImpl : FeederRepository` holding the known feeders and selected-feeder id in `MutableStateFlow`s (replacing Plan 01's `InMemoryFeederRepository` fake) — supports add/remove/select, backed by nothing more durable than process memory.
- If persistence is ever needed later (e.g. users complain about re-adding feeders after every restart), swap in Jetpack DataStore behind this same interface — not Room, which would be overkill for a flat list with no relations or migrations.

### 2. Pairing wizard (new feeder → home Wi-Fi)
Compose flow, roughly:
1. Prompt user to put the feeder in setup mode (device raises `PetFeeder-Setup` open AP).
2. Guide user to join that AP (Android can't reliably auto-join arbitrary open APs on all API levels without `WifiNetworkSpecifier`/`ACTION_PICK_WIFI_NETWORK` UX — use the platform-appropriate mechanism for target `minSdk 26`/current `targetSdk`, confirming behavior on API 26 vs 29+ where `WifiNetworkSpecifier` becomes available).
3. Once joined, `PUT` the user's home Wi-Fi `ssid`/`password` to the device's `/settings` at its AP-mode address.
4. Prompt the user to confirm the device has reconnected to home Wi-Fi and rejoin their own network.

### 3. Manual add-by-host (primary v1 discovery mechanism)
- Simple form: friendly name (required, local-only) + host (IP or hostname, required).
- On submit, verify reachability with a lightweight request (e.g. `GET /settings`) before saving, surfacing a clear error if unreachable — but per the product decision already made, an unreachable feeder is otherwise just "not there yet," not something the app tracks as degraded/offline state.
- Save as a new in-memory `Feeder` entry.

### 4. Feeder management UI
- List of paired feeders (name + host), supporting: select as current, edit name, edit host, remove.
- Feeder switcher accessible from the main app shell (e.g. a dropdown/menu in the top bar), wired to `FeederRepository.selectFeeder`.

### 5. Extension point for future discovery
- Structure the "find candidate feeders" step behind a small internal interface (e.g. `FeederDiscoverySource`) even though the only v1 implementation is "user typed in a host." This keeps the door open for an mDNS-based `FeederDiscoverySource` later without reworking the pairing/registry UI.

## Out of scope
- mDNS/NSD-based discovery (tracked in the [firmware migration gap ledger](../../firmware-migration-gaps.md); this is parity work, not a backwards-compatibility requirement).
- Any device-side friendly-name sync (future firmware work; distinguish this from the local display name).
- Notifications/FCM registration flow.
- Anything about what happens once a feeder is selected (that's Plans 03-06).

## Acceptance criteria
- A user can pair a brand-new feeder (AP join → Wi-Fi credentials → confirmation) end to end against real `code2` firmware.
- A user can manually add a feeder already on the home network by host, name it, and select it.
- `FeederRepository.feeders` and `.selectedFeeder` reflect the in-memory registry reactively (Flow-based); the list is expected to reset on process death (no persistence layer for this plan).
- ViewModel/UseCase logic (add feeder, remove feeder, select feeder, validate host reachability) has JUnit5/MockK unit test coverage.
- Plans 03-06 can be implemented purely against the `FeederRepository` interface with no changes needed here.

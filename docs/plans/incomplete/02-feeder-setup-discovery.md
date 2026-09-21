# Plan 02 — Feeder Setup / Discovery / Management

## Goal
Let a user pair a new feeder to the app and manage the set of feeders they own, providing the real implementation of the `FeederRepository` contract that Plan 01 defines and all other feature plans depend on.

## Dependencies
- Plan 01 (Base App Foundation) must exist first: this plan implements the `FeederRepository` interface it defines, and adds Room entities/DAOs to the `PetFeederDatabase` module Plan 01 scaffolds.
- No dependency on Plans 03-06; those depend on this plan's output (a working `FeederRepository`), not the other way around.

## Context / firmware reality check
`code2` (the ESP32/ESP-IDF firmware this targets) currently has:
- No mDNS/LAN service discovery of any kind.
- A fixed soft-AP SSID `PetFeeder-Setup` (open network, not per-device-random) that the device raises when it can't connect to configured Wi-Fi.
- No `name`/label field on `/settings` — the device has no concept of a user-facing friendly name.

Because of this, v1 discovery is **manual add-by-IP/hostname**, and the feeder's friendly name is **stored client-side only** in this app's local registry (Room) — it is not synced to or from the device. mDNS-based discovery and a device-side name field are tracked as a future firmware improvement, not blocking work for this plan.

## What this plan delivers

### 1. Local feeder registry (Room)
- `FeederEntity` (id, displayName, host, dateAdded, maybe lastConnectedAt) + DAO, added to the `PetFeederDatabase` from Plan 01.
- `FeederRepositoryImpl : FeederRepository` backed by the DAO, replacing/supplying the fake implementation from Plan 01.
- Simple in-memory/DataStore-backed "currently selected feeder id" (survives process death) driving `FeederRepository.selectedFeeder`.

### 2. Pairing wizard (new feeder → home Wi-Fi)
Compose flow, roughly:
1. Prompt user to put the feeder in setup mode (device raises `PetFeeder-Setup` open AP).
2. Guide user to join that AP (Android can't reliably auto-join arbitrary open APs on all API levels without `WifiNetworkSpecifier`/`ACTION_PICK_WIFI_NETWORK` UX — use the platform-appropriate mechanism for target `minSdk 26`/current `targetSdk`, confirming behavior on API 26 vs 29+ where `WifiNetworkSpecifier` becomes available).
3. Once joined, `PUT` the user's home Wi-Fi `ssid`/`password` to the device's `/settings` at its AP-mode address.
4. Prompt the user to confirm the device has reconnected to home Wi-Fi and rejoin their own network.

### 3. Manual add-by-host (primary v1 discovery mechanism)
- Simple form: friendly name (required, local-only) + host (IP or hostname, required).
- On submit, verify reachability with a lightweight request (e.g. `GET /settings`) before saving, surfacing a clear error if unreachable — but per the product decision already made, an unreachable feeder is otherwise just "not there yet," not something the app tracks as degraded/offline state.
- Save as a new `FeederEntity`.

### 4. Feeder management UI
- List of paired feeders (name + host), supporting: select as current, edit name, edit host, remove.
- Feeder switcher accessible from the main app shell (e.g. a dropdown/menu in the top bar), wired to `FeederRepository.selectFeeder`.

### 5. Extension point for future discovery
- Structure the "find candidate feeders" step behind a small internal interface (e.g. `FeederDiscoverySource`) even though the only v1 implementation is "user typed in a host." This keeps the door open for an mDNS-based `FeederDiscoverySource` later without reworking the pairing/registry UI.

## Out of scope
- mDNS/NSD-based discovery (future firmware + app work once `code2` gains it).
- Any device-side friendly-name sync (future firmware work).
- Notifications/FCM registration flow.
- Anything about what happens once a feeder is selected (that's Plans 03-06).

## Acceptance criteria
- A user can pair a brand-new feeder (AP join → Wi-Fi credentials → confirmation) end to end against real `code2` firmware.
- A user can manually add a feeder already on the home network by host, name it, and select it.
- `FeederRepository.feeders` and `.selectedFeeder` reflect Room state reactively (Flow-based), and `selectFeeder` persists across process death.
- ViewModel/UseCase logic (add feeder, remove feeder, select feeder, validate host reachability) has JUnit5/MockK unit test coverage.
- Plans 03-06 can be implemented purely against the `FeederRepository` interface with no changes needed here.

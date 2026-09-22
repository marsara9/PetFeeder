# Plan 06 — Settings

## Goal
Let the user view and update the currently selected feeder's device settings.

## Dependencies
- Plan 01 (Base App Foundation): MVI base pattern, `FeederApiClientFactory`, shared error helpers.
- Plan 02 (Feeder Setup / Discovery): a real `FeederRepository`/selected feeder, and the local "friendly name" concept (which lives in the local feeder registry, not on the device — see below). Can be developed against Plan 01's fake repository in the meantime.

## Retrofit interface ownership
This plan owns `SettingsApi`:
```kotlin
interface SettingsApi {
    @GET("/settings")
    suspend fun getSettings(): SettingsDto // currently just { "ssid": "..." }

    @PUT("/settings")
    suspend fun putSettings(
        @Query("ssid") ssid: String? = null,
        @Query("password") password: String? = null,
    )
}
```

## Firmware contract notes
- See the [firmware migration gap ledger](../../firmware-migration-gaps.md) for
    the complete settings and provisioning parity work. This plan should keep
    the firmware follow-up visible: add a persisted device hostname/default
    identity and expose it through the new settings contract if the modernized
    product wants the device to own that identity. Do not confuse that field
    with the app-local display name described below.
- `code2`'s `/settings` today only models Wi-Fi credentials: `GET` returns `{ "ssid": "..." }` (password never echoed back); `PUT` accepts `ssid`/`password` query params, persists to SD, and takes effect after the next reboot (no live reconnect-during-request yet per the firmware README).
- There is currently **no device-side hostname or friendly-name field**. The "name" the user sees for a feeder throughout the app is the **local-only** name from Plan 02's feeder registry (Room) — this screen should let the user edit that local name too, but that's a local Room write via `FeederRepository`, not a call to the device's `/settings`.
- Exact additional fields this screen should expose beyond Wi-Fi are explicitly deferred/TBD — scope this plan's first implementation to what `/settings` actually exposes today (ssid/password) plus the local display-name edit, and treat additional settings as incremental follow-ups as firmware grows rather than speculative UI now.

## What this plan delivers
1. `SettingsUiState` (current ssid shown, local display name, loading/saving/error state) + `SettingsIntent` (`Load`, `UpdateWifiCredentials(ssid, password)`, `UpdateDisplayName(name)`).
2. `SettingsViewModel` per the MVI pattern.
3. UseCases:
   - `GetFeederSettingsUseCase` (device `GET /settings` + local display name from `FeederRepository`).
   - `UpdateWifiCredentialsUseCase` (device `PUT /settings`; surface the "takes effect after reboot" caveat in the UI copy so users aren't confused when nothing changes immediately).
   - `UpdateFeederDisplayNameUseCase` (local Room write only, via `FeederRepository`).
4. Compose screen: ssid/password fields (password write-only, never pre-filled from a `GET`), a save action, a separate display-name field, loading/error/success feedback.
5. Unit tests (JUnit5/MockK) for all three UseCases and the ViewModel's intent → state cycle, including the case where updating Wi-Fi credentials could disconnect the app from the feeder's current network context (surface as an expected/handled outcome, not a crash/generic error).

## Out of scope
- Any settings field not currently exposed by `/settings` (deferred until firmware grows further — do not speculatively build UI for fields that don't exist).
- Feeder pairing/removal (Plan 02 — this screen only edits an already-paired feeder's settings).
- Notifications settings (notifications are out of scope for the whole rewrite currently).

## Acceptance criteria
- Viewing settings shows the device's current ssid (never a password) and the locally-stored display name.
- Updating Wi-Fi credentials successfully PUTs to the device and the UI clearly communicates the reboot-to-apply caveat.
- Updating the display name persists locally via `FeederRepository` and is reflected wherever the feeder's name is shown elsewhere in the app (dashboard, feeder switcher, etc.).
- UseCase/ViewModel logic has passing unit tests.

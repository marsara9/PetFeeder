# Plan 04 — Schedule

## Goal
Let the user view and manage the currently selected feeder's daily feeding schedule (add, edit, delete scheduled feed times/amounts).

## Dependencies
- Plan 01 (Base App Foundation): MVI base pattern, `FeederApiClientFactory`, shared date/time (local↔UTC) + error helpers.
- Plan 02 (Feeder Setup / Discovery): a real `FeederRepository`/selected feeder. Can be developed against Plan 01's fake repository in the meantime.

## Retrofit interface ownership
This plan owns `ScheduleApi`:
```kotlin
interface ScheduleApi {
    @GET("/schedule")
    suspend fun getSchedules(): List<ScheduleDto>

    @PUT("/schedule/{uuid}")
    suspend fun putSchedule(
        @Path("uuid") uuid: String,
        @Query("cups") cups: Double,
        @Query("time") time: String, // "HH:MM", UTC, zero-padded
    )

    @DELETE("/schedule/{uuid}")
    suspend fun deleteSchedule(@Path("uuid") uuid: String)
}
```

## Firmware contract notes — read carefully, these are hard requirements, not design choices
- **The app generates the schedule's UUID**, not the device. `PUT /schedule/{uuid}` is idempotent and the firmware does not generate or replace the id — generate a UUID client-side (e.g. `java.util.UUID.randomUUID()`) when the user creates a new schedule entry, and use it for that PUT (and for the later DELETE).
- **All schedule times are UTC**, format `HH:MM` (zero-padded, e.g. `08:30`). The Android app is fully responsible for converting the user's local time selection to UTC before sending, and converting back to local time for display. Use Plan 01's shared date/time conversion helpers — do not reimplement this conversion locally.
- There is no separate "create" vs "update" endpoint — the same idempotent `PUT /schedule/{uuid}` is used whether the app is creating a brand-new entry (new UUID) or editing an existing one (existing UUID, new cups/time).
- `GET /schedule` returns the current full list; there's no dedicated "get by id."

## What this plan delivers
1. `ScheduleUiState` (list of schedule entries in local time for display, loading/error state) + `ScheduleIntent` (`Refresh`, `AddSchedule(cups, localTime)`, `EditSchedule(id, cups, localTime)`, `DeleteSchedule(id)`).
2. `ScheduleViewModel` per the MVI pattern, delegating to UseCases only.
3. UseCases:
   - `GetSchedulesUseCase` (fetch + map UTC `HH:MM` → local `LocalTime` for display).
   - `SaveScheduleUseCase` (handles both add and edit — generates a new UUID only when adding; converts local time to UTC before calling `putSchedule`).
   - `DeleteScheduleUseCase`.
4. Compose screen: list of schedule entries (time + cups, shown in local time), add/edit dialog or screen with a time picker and a cups amount input, delete action (e.g. swipe or per-item button) — UI polish deferred per project direction, just needs to work.
5. Unit tests (JUnit5/MockK) for all three UseCases, with explicit coverage of the local↔UTC conversion at day-boundary edge cases (e.g. a local time that crosses midnight UTC), plus ViewModel tests for the full intent → state cycle for add/edit/delete.

## Out of scope
- Dashboard/manual feed (Plan 03).
- Feeding history (Plan 05).
- Any device-side validation beyond what the firmware already enforces (cups must be a valid multiple/format per firmware rules) — surface the firmware's `400`/error response rather than duplicating its validation rules client-side, to avoid the two drifting out of sync.

## Acceptance criteria
- Creating a schedule entry from the app results in a device-side entry with the correct UTC time for the user's local input, verified against a real `code2` device.
- Editing an existing entry reuses its UUID (PUT, not a new entry).
- Deleting removes it from the device and from the displayed list.
- Local↔UTC conversion is unit-tested including at least one timezone-crossing-midnight case.

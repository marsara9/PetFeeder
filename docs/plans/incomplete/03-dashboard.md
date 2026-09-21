# Plan 03 — Dashboard

## Goal
Show the user, for the currently selected feeder, how much food has been dispensed today, and let them trigger a manual feeding.

## Dependencies
- Plan 01 (Base App Foundation): MVI base pattern, `FeederApiClientFactory`, shared date/time + error helpers, Room/DI scaffolding.
- Plan 02 (Feeder Setup / Discovery): a real `FeederRepository` with at least one selected feeder. Until Plan 02 lands, this plan can be developed/tested against Plan 01's fake `FeederRepository`.

## Retrofit interface ownership
This plan **owns and defines** `FeedingApi`, covering both feed endpoints:
```kotlin
interface FeedingApi {
    @GET("/feed")
    suspend fun getFeedings(): List<FeedingDto>

    @POST("/feed")
    suspend fun createFeeding(@Query("cups") cups: Double): FeedingDto
}
```
Plan 05 (History) depends on this interface rather than redefining it — coordinate signature changes with that plan if they become necessary.

## Firmware contract notes
- `POST /feed?cups=<float>` records the feeding and starts the motor in a background task, returning `200 OK` with the new feeding record **immediately**, without waiting for the dispense to finish. The UI should reflect "feed recorded" right away rather than waiting/polling for physical completion.
- Only one motor operation is accepted at a time — a `POST /feed` while the motor is busy will be rejected by the device (mapped through the shared error handling from Plan 01); surface this as a clear "feeder is busy, try again" message rather than a generic error.
- `GET /feed` returns the full feeding history as `[{ "id", "cups", "date" }]` with `date` in UTC ISO-8601. There is no server-side date-range filter — "today's total" is computed client-side by filtering the returned list to the user's local "today" (using Plan 01's shared UTC↔local conversion) and summing `cups`.
- No pagination/date-range query params exist; this plan fetches the full list to compute today's total (acceptable given firmware caps history at 1,000 entries / 365 days — see Plan 05 for whether that same fetch should be shared/cached with History).

## What this plan delivers
1. `DashboardUiState` (e.g. `cupsDispensedToday: Double`, `isFeeding: Boolean`, `errorMessage: String?`, loading flag) + `DashboardIntent` (`Refresh`, `TriggerManualFeed(cups: Double)`).
2. `DashboardViewModel` implementing the MVI pattern from Plan 01, using UseCases below — no direct Retrofit calls from the ViewModel.
3. UseCases:
   - `GetTodaysDispensedAmountUseCase` (fetches via `FeedingApi.getFeedings()`, filters/sums client-side).
   - `TriggerManualFeedUseCase` (calls `FeedingApi.createFeeding`, maps device "motor busy" error to a typed result).
4. Compose screen: today's total, a manual-feed button (with a simple cups-amount input — exact control/UI polish deferred, "just needs to work" per project direction), loading and error states, busy/in-progress feedback while a feed request is in flight.
5. Unit tests (JUnit5/MockK) for both UseCases and the ViewModel covering: normal refresh, empty history (0 today), manual feed success, manual feed rejected because motor busy, network/feeder-unreachable error.

## Out of scope
- Full feeding history browsing (Plan 05).
- Schedule management (Plan 04).
- Any offline/stale-data handling — per the product decision, an unreachable feeder is simply an error state, not a cached/stale view.

## Acceptance criteria
- Dashboard shows correct today-total against a real `code2` device across a day boundary (i.e. correctly excludes yesterday's entries per local time).
- Manual feed button successfully dispenses and the total updates without a manual refresh.
- Motor-busy rejection is shown as a distinct, understandable message rather than a generic failure.
- All new business logic (UseCases + ViewModel) has passing unit tests.

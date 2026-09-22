# Plan 05 — History

## Goal
Let the user browse all previous feedings (manual and scheduled) for the currently selected feeder.

## Dependencies
- Plan 01 (Base App Foundation): MVI base pattern, `FeederApiClientFactory`, shared date/time + error helpers.
- Plan 02 (Feeder Setup / Discovery): a real `FeederRepository`/selected feeder. Can be developed against Plan 01's fake repository in the meantime.
- **Plan 03 (Dashboard): consumes `FeedingApi` defined there** — this plan does not define its own feeding API interface. If this plan needs a `FeedingApi` capability that doesn't exist yet (e.g. a shape/field not currently modeled), coordinate the change into Plan 03's interface rather than forking a parallel definition.

## Firmware contract notes
- See the [firmware migration gap ledger](../../firmware-migration-gaps.md)
	when validating history semantics, especially the replacement firmware's
	asynchronous feed execution and the fact that history is recorded before
	the motor task completes.
- `GET /feed` returns the full feeding history as `[{ "id", "cups", "date" }]`, UTC ISO-8601 timestamps, with no pagination or date-range query params. Firmware retains up to `DATASTORE_MAX_FEEDINGS` (1,000) entries or `DATASTORE_FEEDING_RETENTION_DAYS` (365) days, whichever is hit first — so the full list returned is bounded and safe to load in one call without needing app-side pagination for v1.
- No distinction in the response between "manual" and "scheduled" feedings — if that distinction matters for display, it is not available; do not invent it client-side without a firmware change (flag to the user/developer if this turns out to matter rather than assuming).

## What this plan delivers
1. `HistoryUiState` (list of feeding entries mapped to local time for display, loading/error/empty state) + `HistoryIntent` (`Refresh`).
2. `HistoryViewModel` per the MVI pattern.
3. UseCase: `GetFeedingHistoryUseCase` (calls `FeedingApi.getFeedings()` from Plan 03, maps UTC timestamps to local time via Plan 01's shared converters, sorts newest-first).
4. Compose screen: a simple list (date/time + cups) with pull-to-refresh or a refresh action, loading/empty/error states.
5. Unit tests (JUnit5/MockK) for the UseCase (sorting, mapping, empty-list handling) and the ViewModel's intent → state cycle.

## Out of scope
- Any filtering/search/date-range UI beyond a plain reverse-chronological list — can be a fast-follow if the full-history list proves unwieldy in practice, but not required for v1 given the firmware's own 1,000-entry/365-day cap.
- Manual feed triggering (Plan 03).
- Schedule management (Plan 04).

## Acceptance criteria
- All feedings recorded on a real `code2` device (manual and scheduled) appear in the list, newest first, in local time.
- Empty state displays correctly for a feeder with no recorded feedings.
- UseCase/ViewModel logic has passing unit tests.

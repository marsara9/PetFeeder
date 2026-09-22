# Plan 01 — Base App Foundation

## Goal
Stand up the Android app skeleton and shared architecture that every feature plan builds on. This plan ships **no feature business logic** (no dashboard/schedule/history/settings behavior) — it delivers the scaffolding, conventions, and shared infrastructure other plans depend on.

## Context
This is a full rewrite of `android/`. Nothing from the existing Koin/RxJava/Retrofit/View-Binding app is carried forward as-is, but the domain (talking to one or more PetFeeder devices over the LAN) is preserved. Target firmware is `code2` (ESP32/ESP-IDF); `code` (ESP8266/Arduino) is legacy and will be deleted — do not build against it.

## Decisions locked in for this plan (and inherited by all feature plans)
- **UI:** Jetpack Compose, Material3, single Activity, Compose Navigation.
- **Async:** Kotlin Coroutines + Flow. No RxJava.
- **DI:** Hilt (tentative — acceptable to swap for Koin or manual DI before real implementation work begins if it proves not worth the codegen overhead for an app this size; isolate DI wiring so a swap doesn't ripple through feature code).
- **Presentation pattern:** Lightweight MVI per screen:
  - One immutable `data class XyzUiState(...)` exposed as `StateFlow<XyzUiState>` from the ViewModel.
  - One sealed `XyzIntent` hierarchy; ViewModel exposes a single `fun onIntent(intent: XyzIntent)` entry point.
  - One-off effects (navigation, snackbars) go through a `Channel<XyzEffect>`/`SharedFlow`, never through UiState.
  - No reducer/middleware framework, no Redux-style store — keep it to plain ViewModel + StateFlow + sealed classes.
  - A `UseCase` layer sits between ViewModels and repositories (one class per user action/query, e.g. `TriggerManualFeedUseCase`). ViewModels depend on UseCases, never directly on Retrofit services.
- **Networking:** Retrofit + OkHttp + a JSON converter (kotlinx-serialization or Moshi — pick one here and use it everywhere). Each feature plan defines its own Retrofit **service interface(s)** scoped to the endpoints it owns (see "Retrofit interface ownership" below). This plan provides only the **generic, swappable-base-URL machinery**:
  - A `FeederApiClientFactory` (or similar) that, given a feeder's host, builds/returns a `Retrofit` instance for that host, cached per feeder id so repeated calls to the same feeder reuse the client.
  - Do **not** use a single shared Retrofit instance with an interceptor that rewrites the target host per-request — build a distinct client per feeder id instead, per the architecture decision already made.
  - Shared OkHttp configuration (timeouts, logging interceptor in debug builds, error-body parsing helper for the device's `{"error":{"code":...,"message":...}}` shape).
  - Shared date/time (de)serialization for the device's UTC ISO-8601 timestamps (`2026-09-21T12:00:00Z`) and the `HH:MM` schedule time format.
- **Local persistence:** Room, but this plan only sets up the Room database/module scaffolding (empty of entities). The `FeederRepository`/feeder registry entities and DAOs belong to Plan 02 (Feeder Setup / Discovery).
- **Module structure:** Single Gradle module (`app`), organized by feature package (`dashboard/`, `schedule/`, `history/`, `settings/`, `feeder/`, `core/` or `common/` for this plan's shared pieces).
- **SDK:** `minSdk 26`, `targetSdk` raised to current latest stable (35 at time of writing). Revisit only if it causes real problems.
- **Testing:** JUnit5 + MockK for ViewModel/UseCase unit tests. Add Turbine only if plain `Flow` collection (`.first()`, `runTest { ... }.toList()`) proves awkward in practice — don't pre-emptively add it.
- **Out of scope for the whole rewrite (for now):** FCM/push notifications. Do not scaffold any notification plumbing.

## What this plan delivers
1. **App shell:** `MainActivity` hosting a Compose `NavHost`, with a nav graph containing placeholder/empty composables for Dashboard, Schedule, History, and Settings routes (real screen content arrives in their respective plans), plus bottom navigation (or nav rail) between them.
2. **Feeder context / switcher shell:** A top-level "currently selected feeder" concept (e.g. a `CurrentFeederHolder`/`SelectedFeederRepository` interface) that feature screens read from to know which feeder's API client to use. This plan defines the **interface only** with a fake/in-memory implementation (e.g. hardcoded single feeder or empty state) — Plan 02 supplies the real Room-backed implementation. Keep the interface minimal:
   ```kotlin
   interface FeederRepository {
       val feeders: Flow<List<Feeder>>
       val selectedFeeder: Flow<Feeder?>
       suspend fun selectFeeder(id: String)
   }
   data class Feeder(val id: String, val displayName: String, val host: String)
   ```
3. **`FeederApiClientFactory`** (or equivalently named) as described above, taking a `Feeder`/host and returning cached Retrofit instance(s).
4. **Shared networking primitives:** JSON converter setup, base OkHttp client builder, error-body model + parsing helper, date/time converters.
5. **Room database module scaffolding:** `PetFeederDatabase` (empty, no entities yet) wired through Hilt, ready for Plan 02 to add its feeder-registry entities/DAOs.
6. **DI wiring:** Hilt `@Module`/`@InstallIn` setup for the above (networking factory, Room database, dispatchers/coroutine scope providers).
7. **Testing scaffolding:** Gradle test dependencies (JUnit5, MockK), a base test rule/utilities if needed (e.g. `MainDispatcherRule` for swapping `Dispatchers.Main` in tests), and one example ViewModel test demonstrating the MVI test pattern (intent in → state out) so feature plans have a template to follow.

## Retrofit interface ownership (for reference, implemented in their own plans)
- `SettingsApi` (`GET/PUT /settings`) → Plan 06 (Settings)
- `ScheduleApi` (`GET/PUT /schedule/{uuid}`, `DELETE /schedule/{uuid}`) → Plan 04 (Schedule)
- `FeedingApi` (`GET/POST /feed`) → owned by Plan 03 (Dashboard), consumed by Plan 05 (History) as a dependency rather than redefined

This plan does not define any of the above interfaces.

## Firmware contract notes relevant to this plan
- Firmware is `code2` (ESP32/ESP-IDF). No mDNS, no per-feeder `name` field, no FCM — these gaps are tracked centrally in [firmware-migration-gaps.md](../../firmware-migration-gaps.md). Discovery and device naming belong to Plan 02; notification parity is currently deferred, but must not be forgotten if that scope changes.
- All device timestamps and schedule times are UTC; the device does zero timezone conversion. Shared date/time converters in this plan must make local↔UTC conversion easy for feature plans to use consistently (single source of truth for the conversion logic, not reimplemented per feature).
- Device error responses follow `{"error":{"code":<int>,"message":"..."}}` — the shared error-parsing helper should turn this into a typed exception/result feature plans can pattern-match on.

## Out of scope
- Any actual screen UI/business logic (dashboard totals, schedule CRUD, history list, settings form) — those are separate plans.
- Feeder pairing, discovery, or the real feeder registry — Plan 02.
- Notifications.

## Acceptance criteria
- App builds and launches to a navigable shell (empty placeholder screens reachable via bottom nav).
- `FeederApiClientFactory` has a unit test proving it returns a cached instance for the same feeder id and a distinct instance for a different feeder id/host.
- Date/time and error-parsing helpers have unit tests covering the documented device formats.
- A feature plan can be implemented against `FeederRepository` (the interface) and the networking factory without needing changes to this plan's code.

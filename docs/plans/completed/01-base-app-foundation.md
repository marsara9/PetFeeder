# Plan 01 — Base App Foundation

## Goal
Stand up the Android app skeleton and shared architecture that every feature plan builds on. This plan ships **no feature business logic** (no dashboard/schedule/history/settings behavior) — it delivers the scaffolding, conventions, and shared infrastructure other plans depend on.

## Context
This is a full rewrite of `android/`, developed in the parallel `android2/` staging project until migration parity is reached. Nothing from the existing Koin/RxJava/Retrofit/View-Binding app is carried forward as-is, but the domain (talking to one or more PetFeeder devices over the LAN) is preserved. Target firmware is `code2` (ESP32/ESP-IDF); `code` (ESP8266/Arduino) is legacy and will be deleted — do not build against it.

## Decisions locked in for this plan (and inherited by all feature plans)
- **UI:** Jetpack Compose, Material3, single Activity, Compose Navigation.
- **Async:** Kotlin Coroutines + Flow. No RxJava.
- **DI:** Manual DI via a single `AppContainer` held by the `Application` subclass (Hilt was tentative and, given annotation-processor/Kotlin-version churn on this bleeding-edge toolchain, isn't worth the overhead yet; DI wiring is isolated in `core/di` so swapping to Hilt/Koin later doesn't ripple through feature code).
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
- **Local persistence:** Deferred. Room scaffolding is **not** set up by this plan — it isn't needed until Plan 02 (Feeder Setup / Discovery) introduces the real feeder registry, so it will be added there instead of speculatively here.
- **Module structure:** Single Gradle module (`app`), organized by feature package (`dashboard/`, `schedule/`, `history/`, `settings/`, `feeder/`, `core/` or `common/` for this plan's shared pieces).
- **SDK:** `minSdk 26`, `targetSdk` raised to current latest stable (35 at time of writing). Revisit only if it causes real problems.
- **Screen sizes:** Phone-only for now. No adaptive/tablet layout (navigation rail, list-detail panes, etc.) — revisit if/when tablet support becomes a real requirement.
- **Visual theme:** The primary palette is `#333`, `#1ed2ff`, `#000`, and `#fff`. Additional supporting colors may be introduced where needed, but these colors should anchor the app's visual language. Preserve [ic_avatar_cat.xml](../../../android/app/src/main/res/drawable-v24/ic_avatar_cat.xml) as the primary artwork for [ic_launcher.xml](../../../android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml), including the round launcher variant where applicable.
- **Testing:** JUnit5 + MockK for ViewModel/UseCase unit tests. Add Turbine only if plain `Flow` collection (`.first()`, `runTest { ... }.toList()`) proves awkward in practice — don't pre-emptively add it.
- **Out of scope for the whole rewrite (for now):** FCM/push notifications. Do not scaffold any notification plumbing.

## What this plan delivers
1. **App shell:** `MainActivity` hosting a Compose `NavHost`, with a nav graph containing placeholder/empty composables for Dashboard, Schedule, History, and Settings routes (real screen content arrives in their respective plans), plus a Material 3 bottom navigation bar. Phone-only; no adaptive navigation rail for larger layouts.
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
5. ~~Room database module scaffolding~~ — skipped for this plan (see "Local persistence" decision above); Plan 02 sets up Room from scratch when it adds the feeder registry.
6. **DI wiring:** Manual `AppContainer` (see "DI" decision above) providing the above (networking factory, feeder repository, dispatcher provider) to the `Application` subclass.
7. **Testing scaffolding:** Gradle test dependencies (JUnit5, MockK, kotlinx-coroutines-test), a base test utility (`MainDispatcherExtension`, a JUnit5 extension for swapping `Dispatchers.Main` in tests), and one example ViewModel test demonstrating the MVI test pattern (intent in → state out) so feature plans have a template to follow.

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

package com.sdoras.petfeeder.core.feeder

import kotlinx.coroutines.flow.Flow

/**
 * Source of truth for known feeders and which one is currently selected.
 *
 * This plan only ships [InMemoryFeederRepository]; Plan 02 (Feeder Setup / Discovery) replaces it
 * with a Room-backed implementation without feature code needing to change.
 */
interface FeederRepository {
    val feeders: Flow<List<Feeder>>
    val selectedFeeder: Flow<Feeder?>
    suspend fun selectFeeder(id: String)
}

package com.sdoras.petfeeder.core.feeder

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.combine

/**
 * Fake, in-memory [FeederRepository] used until Plan 02 supplies a Room-backed implementation.
 * Seeds a single hardcoded feeder so feature screens have something to select against.
 */
class InMemoryFeederRepository : FeederRepository {

    private val knownFeeders = MutableStateFlow(
        listOf(Feeder(id = "local", displayName = "Pet Feeder", host = "http://petfeeder.local")),
    )
    private val selectedFeederId = MutableStateFlow(knownFeeders.value.firstOrNull()?.id)

    override val feeders: Flow<List<Feeder>> = knownFeeders

    override val selectedFeeder: Flow<Feeder?> =
        combine(knownFeeders, selectedFeederId) { feeders, id -> feeders.find { it.id == id } }

    override suspend fun selectFeeder(id: String) {
        selectedFeederId.value = id
    }
}

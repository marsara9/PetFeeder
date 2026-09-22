package com.sdoras.petfeeder.core.feeder

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine

/** Combines the known feeders and the current selection into the shape the feeder switcher UI needs. */
class ObserveFeederSwitcherStateUseCase(private val repository: FeederRepository) {
    operator fun invoke(): Flow<FeederSwitcherUiState> =
        combine(repository.feeders, repository.selectedFeeder) { feeders, selected ->
            FeederSwitcherUiState(feeders = feeders, selectedFeederId = selected?.id)
        }
}

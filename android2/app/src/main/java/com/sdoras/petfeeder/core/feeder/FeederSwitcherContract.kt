package com.sdoras.petfeeder.core.feeder

/** UI state for the feeder switcher, following this app's MVI convention. */
data class FeederSwitcherUiState(
    val feeders: List<Feeder> = emptyList(),
    val selectedFeederId: String? = null,
)

/** User intents for the feeder switcher, following this app's MVI convention. */
sealed class FeederSwitcherIntent {
    data class SelectFeeder(val id: String) : FeederSwitcherIntent()
}

package com.sdoras.petfeeder.core.feeder

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch

/**
 * Reference implementation of this app's MVI pattern: one [uiState] `StateFlow`, one [onIntent]
 * entry point, ViewModel depends on use cases rather than the repository directly.
 */
class FeederSwitcherViewModel(
    observeState: ObserveFeederSwitcherStateUseCase,
    private val selectFeeder: SelectFeederUseCase,
) : ViewModel() {

    val uiState: StateFlow<FeederSwitcherUiState> = observeState()
        .stateIn(viewModelScope, SharingStarted.Eagerly, FeederSwitcherUiState())

    fun onIntent(intent: FeederSwitcherIntent) {
        when (intent) {
            is FeederSwitcherIntent.SelectFeeder -> viewModelScope.launch { selectFeeder(intent.id) }
        }
    }
}

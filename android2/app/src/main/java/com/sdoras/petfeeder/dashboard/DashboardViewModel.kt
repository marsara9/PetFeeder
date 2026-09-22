package com.sdoras.petfeeder.dashboard

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.core.feeder.Feeder
import com.sdoras.petfeeder.core.feeder.FeederRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch

data class DashboardUiState(
    val feederName: String? = null,
    val cupsDispensedToday: Double = 0.0,
    val isLoading: Boolean = false,
    val isFeeding: Boolean = false,
    val errorMessage: String? = null,
)

sealed interface DashboardIntent {
    data object Refresh : DashboardIntent
    data class TriggerManualFeed(val cups: Double) : DashboardIntent
    data object DismissError : DashboardIntent
}

class DashboardViewModel(
    private val repository: FeederRepository,
    private val apiForSelectedFeeder: (Feeder) -> FeedingApi,
    private val getTodaysAmount: suspend (FeedingApi) -> Double = { GetTodaysDispensedAmountUseCase(it)() },
    private val triggerFeed: suspend (FeedingApi, Double) -> FeedResult = { api, cups ->
        TriggerManualFeedUseCase(api)(cups)
    },
) : ViewModel() {
    private val mutableUiState = MutableStateFlow(DashboardUiState())
    val uiState: StateFlow<DashboardUiState> = mutableUiState.asStateFlow()

    private var selectedFeeder: Feeder? = null

    init {
        viewModelScope.launch {
            repository.selectedFeeder.collectLatest { feeder ->
                selectedFeeder = feeder
                mutableUiState.value = DashboardUiState(feederName = feeder?.displayName)
                if (feeder != null) refresh()
            }
        }
    }

    fun onIntent(intent: DashboardIntent) {
        when (intent) {
            DashboardIntent.Refresh -> viewModelScope.launch { refresh() }
            is DashboardIntent.TriggerManualFeed -> viewModelScope.launch { feed(intent.cups) }
            DashboardIntent.DismissError -> mutableUiState.value = mutableUiState.value.copy(errorMessage = null)
        }
    }

    private suspend fun refresh() {
        val feeder = selectedFeeder ?: return
        val api = apiForSelectedFeeder(feeder)
        mutableUiState.value = mutableUiState.value.copy(isLoading = true, errorMessage = null)
        runCatching { getTodaysAmount(api) }
            .onSuccess { amount ->
                mutableUiState.value = mutableUiState.value.copy(
                    cupsDispensedToday = amount,
                    isLoading = false,
                )
            }
            .onFailure { error -> showError(error.message ?: "Unable to load feeding history") }
    }

    private suspend fun feed(cups: Double) {
        if (cups <= 0.0 || selectedFeeder == null) return
        val api = apiForSelectedFeeder(selectedFeeder!!)
        mutableUiState.value = mutableUiState.value.copy(isFeeding = true, errorMessage = null)
        when (val result = triggerFeed(api, cups)) {
            is FeedResult.Success -> mutableUiState.value = mutableUiState.value.copy(
                cupsDispensedToday = mutableUiState.value.cupsDispensedToday + result.feeding.cups,
                isFeeding = false,
            )
            FeedResult.Busy -> showError("The feeder is busy. Try again shortly.")
            is FeedResult.Failure -> showError(result.error.message ?: "Unable to start feeding")
        }
    }

    private fun showError(message: String) {
        mutableUiState.value = mutableUiState.value.copy(
            isLoading = false,
            isFeeding = false,
            errorMessage = message,
        )
    }
}

class DashboardViewModelFactory(
    private val repository: FeederRepository,
    private val apiForSelectedFeeder: (Feeder) -> FeedingApi,
) : ViewModelProvider.Factory {
    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T = DashboardViewModel(
        repository = repository,
        apiForSelectedFeeder = apiForSelectedFeeder,
    ) as T
}

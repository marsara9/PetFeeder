package com.sdoras.petfeeder.core.feeder

import com.sdoras.petfeeder.testing.MainDispatcherExtension
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith

/** Demonstrates this app's MVI test pattern: intent in, state out. */
@OptIn(ExperimentalCoroutinesApi::class)
@ExtendWith(MainDispatcherExtension::class)
class FeederSwitcherViewModelTest {

    private val feeders = listOf(
        Feeder(id = "a", displayName = "Feeder A", host = "http://a.local"),
        Feeder(id = "b", displayName = "Feeder B", host = "http://b.local"),
    )

    @Test
    fun `initial state reflects observed feeders and selection`() = runTest {
        val repository = FakeFeederRepository(feeders, selectedId = "a")

        val viewModel = FeederSwitcherViewModel(
            observeState = ObserveFeederSwitcherStateUseCase(repository),
            selectFeeder = SelectFeederUseCase(repository),
        )
        advanceUntilIdle()

        assertEquals(feeders, viewModel.uiState.value.feeders)
        assertEquals("a", viewModel.uiState.value.selectedFeederId)
    }

    @Test
    fun `SelectFeeder intent delegates to the repository`() = runTest {
        val repository = FakeFeederRepository(feeders, selectedId = "a")
        val viewModel = FeederSwitcherViewModel(
            observeState = ObserveFeederSwitcherStateUseCase(repository),
            selectFeeder = SelectFeederUseCase(repository),
        )

        viewModel.onIntent(FeederSwitcherIntent.SelectFeeder("b"))
        advanceUntilIdle()

        assertEquals("b", viewModel.uiState.value.selectedFeederId)
    }

    private class FakeFeederRepository(
        initialFeeders: List<Feeder>,
        selectedId: String?,
    ) : FeederRepository {
        private val feedersFlow = MutableStateFlow(initialFeeders)
        private val selectedIdFlow = MutableStateFlow(selectedId)

        override val feeders = feedersFlow
        override val selectedFeeder = combine(feedersFlow, selectedIdFlow) { list, id ->
            list.find { it.id == id }
        }

        override suspend fun selectFeeder(id: String) {
            selectedIdFlow.value = id
        }
    }
}

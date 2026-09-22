package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.core.feeder.Feeder
import com.sdoras.petfeeder.core.feeder.FeederRepository
import com.sdoras.petfeeder.testing.MainDispatcherExtension
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.extension.ExtendWith
import org.junit.jupiter.api.Test

@OptIn(ExperimentalCoroutinesApi::class)
@ExtendWith(MainDispatcherExtension::class)
class DashboardViewModelTest {
    private val feeder = Feeder("a", "Kitchen feeder", "http://feeder.local")

    @Test
    fun `selected feeder refreshes today's total`() = runTest {
        val viewModel = viewModel(getAmount = { 1.25 })

        advanceUntilIdle()

        assertEquals("Kitchen feeder", viewModel.uiState.value.feederName)
        assertEquals(1.25, viewModel.uiState.value.cupsDispensedToday)
        assertFalse(viewModel.uiState.value.isLoading)
    }

    @Test
    fun `manual feed adds returned feeding to today's total`() = runTest {
        val viewModel = viewModel(getAmount = { 0.5 })
        advanceUntilIdle()

        viewModel.onIntent(DashboardIntent.TriggerManualFeed(0.25))
        advanceUntilIdle()

        assertEquals(0.75, viewModel.uiState.value.cupsDispensedToday)
        assertFalse(viewModel.uiState.value.isFeeding)
    }

    @Test
    fun `busy feed exposes a specific error`() = runTest {
        val viewModel = viewModel(
            getAmount = { 0.0 },
            triggerFeed = { _, _ -> FeedResult.Busy },
        )
        advanceUntilIdle()

        viewModel.onIntent(DashboardIntent.TriggerManualFeed(0.25))
        advanceUntilIdle()

        assertEquals("The feeder is busy. Try again shortly.", viewModel.uiState.value.errorMessage)
        assertFalse(viewModel.uiState.value.isFeeding)
    }

    @Test
    fun `network error is shown and loading ends`() = runTest {
        val viewModel = viewModel(getAmount = { error("unreachable") })

        advanceUntilIdle()

        assertEquals("unreachable", viewModel.uiState.value.errorMessage)
        assertFalse(viewModel.uiState.value.isLoading)
    }

    private fun viewModel(
        getAmount: suspend (FeedingApi) -> Double,
        triggerFeed: suspend (FeedingApi, Double) -> FeedResult = { _, cups ->
            FeedResult.Success(FeedingDto("new", cups, java.time.Instant.now()))
        },
    ): DashboardViewModel = DashboardViewModel(
        repository = FakeRepository(feeder),
        apiForSelectedFeeder = { FakeApi },
        getTodaysAmount = getAmount,
        triggerFeed = triggerFeed,
    )

    private object FakeApi : FeedingApi {
        override suspend fun getFeedings() = emptyList<FeedingDto>()
        override suspend fun createFeeding(cups: Double) = FeedingDto("new", cups, java.time.Instant.now())
    }

    private class FakeRepository(feeder: Feeder) : FeederRepository {
        private val feedersFlow = MutableStateFlow(listOf(feeder))
        private val selectedIdFlow = MutableStateFlow(feeder.id)
        override val feeders = feedersFlow
        override val selectedFeeder = combine(feedersFlow, selectedIdFlow) { feeders, id ->
            feeders.find { it.id == id }
        }
        override suspend fun selectFeeder(id: String) {
            selectedIdFlow.value = id
        }
    }
}

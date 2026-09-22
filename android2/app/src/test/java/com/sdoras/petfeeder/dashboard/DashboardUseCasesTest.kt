package com.sdoras.petfeeder.dashboard

import java.time.Clock
import java.time.Instant
import java.time.ZoneId
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

class DashboardUseCasesTest {
    @Test
    fun `today total uses local date rather than UTC date`() = runTest {
        val zone = ZoneId.of("Asia/Tokyo")
        val clock = Clock.fixed(Instant.parse("2026-09-22T06:00:00Z"), zone)
        val api = FakeFeedingApi(
            feedings = listOf(
                testFeeding("before-local-midnight", 0.25, "2026-09-21T14:59:59Z"),
                testFeeding("today", 0.5, "2026-09-22T14:00:00Z"),
                testFeeding("tomorrow", 1.0, "2026-09-22T15:00:00Z"),
            ),
        )

        val total = GetTodaysDispensedAmountUseCase(api, clock, zone)()

        assertEquals(0.5, total)
    }

    @Test
    fun `empty history has zero total`() = runTest {
        val api = FakeFeedingApi()

        assertEquals(0.0, GetTodaysDispensedAmountUseCase(api)())
    }

    private class FakeFeedingApi(
        private val feedings: List<FeedingDto> = emptyList(),
    ) : FeedingApi {
        override suspend fun getFeedings() = feedings
        override suspend fun createFeeding(cups: Double) = testFeeding("created", cups, "2026-09-22T12:00:00Z")
    }
}

private fun testFeeding(id: String, cups: Double, date: String) = FeedingDto(
    id = id,
    cups = cups,
    date = Instant.parse(date),
)


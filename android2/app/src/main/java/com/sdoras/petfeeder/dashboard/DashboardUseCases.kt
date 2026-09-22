package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.core.network.FeederApiException
import java.time.Clock
import java.time.LocalDate
import java.time.ZoneId

class GetTodaysDispensedAmountUseCase(
    private val api: FeedingApi,
    private val clock: Clock = Clock.systemDefaultZone(),
    private val zoneId: ZoneId = ZoneId.systemDefault(),
) {
    suspend operator fun invoke(): Double {
        val today = LocalDate.now(clock.withZone(zoneId))
        return api.getFeedings()
            .asSequence()
            .filter { it.date.atZone(zoneId).toLocalDate() == today }
            .sumOf { it.cups }
    }
}

class TriggerManualFeedUseCase(private val api: FeedingApi) {
    suspend operator fun invoke(cups: Double): FeedResult = try {
        FeedResult.Success(api.createFeeding(cups))
    } catch (error: FeederApiException) {
        if (error.code == 503) FeedResult.Busy else FeedResult.Failure(error)
    }
}

sealed interface FeedResult {
    data class Success(val feeding: FeedingDto) : FeedResult
    data object Busy : FeedResult
    data class Failure(val error: Throwable) : FeedResult
}

package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.core.network.UtcInstantSerializer
import java.time.Instant
import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Query

@Serializable
data class FeedingDto(
    val id: String,
    val cups: Double,
    @Serializable(with = UtcInstantSerializer::class)
    val date: Instant,
)

interface FeedingApi {
    @GET("feed")
    suspend fun getFeedings(): List<FeedingDto>

    @POST("feed")
    suspend fun createFeeding(@Query("cups") cups: Double): FeedingDto
}

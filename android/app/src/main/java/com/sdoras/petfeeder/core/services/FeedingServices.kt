package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.Feeding
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Query

interface FeedingServices {

    @POST("feed")
    suspend fun manualFeed(
            @Query("cups") cups : Float
    ) : Response<Unit>

    @GET("feed")
    suspend fun getFeedingHistory() : List<Feeding>
}

package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.Feeding
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Query

interface FeedingServices {

    @POST("feed")
    fun manualFeed(
            @Query("cups") cups : Float
    ) : Completable

    @GET("feed")
    fun getFeedingHistory() : Single<List<Feeding>>
}

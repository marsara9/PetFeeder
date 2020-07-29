package com.sdoras.petfeeder.schedules.services

import com.sdoras.petfeeder.schedules.models.ScheduledFeeding
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Query

interface ScheduleServices {

    @POST("schedule")
    fun addScheduledFeeding(
            @Query("cups") cups : Float,
            @Query("hour") hour : Byte,
            @Query("minute") minute : Byte) : Completable

    @GET("schedule")
    fun getAllScheduledFeedings() : Single<List<ScheduledFeeding>>
}

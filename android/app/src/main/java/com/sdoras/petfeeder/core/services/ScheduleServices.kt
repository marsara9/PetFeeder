package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.ScheduledFeeding
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single
import retrofit2.http.*
import java.util.*

interface ScheduleServices {

    @POST("schedule")
    fun addScheduledFeeding(
            @Query("cups") cups : Float,
            @Query("hour") hour : Byte,
            @Query("minute") minute : Byte) : Completable

    @GET("schedule")
    fun getAllScheduledFeedings() : Single<List<ScheduledFeeding>>

    @DELETE("schedule/{id}")
    fun deleteScheduledFeeding(@Path("id") id : UUID) : Completable
}

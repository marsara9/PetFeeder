package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.ScheduledFeeding
import retrofit2.Response
import retrofit2.http.*
import java.util.*

interface ScheduleServices {

    @POST("schedule")
    suspend fun addScheduledFeeding(
            @Query("cups") cups : Float,
            @Query("hour") hour : Byte,
            @Query("minute") minute : Byte
    ) : Response<Unit>

    @GET("schedule")
    suspend fun getAllScheduledFeedings() : List<ScheduledFeeding>

    @DELETE("schedule/{id}")
    suspend fun deleteScheduledFeeding(@Path("id") id : UUID) : Response<Unit>
}

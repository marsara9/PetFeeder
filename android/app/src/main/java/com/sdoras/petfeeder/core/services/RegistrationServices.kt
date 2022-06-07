package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.Registration
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.DELETE
import retrofit2.http.POST
import retrofit2.http.Path
import java.util.*

interface RegistrationServices {

    @POST("register")
    suspend fun registerDevice(@Body registration : Registration) : Response<Unit>

    @DELETE("register/{id}")
    suspend fun deleteRegistration(@Path("id") id : UUID)

}

package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.Registration
import io.reactivex.rxjava3.core.Completable
import retrofit2.http.Body
import retrofit2.http.DELETE
import retrofit2.http.POST
import retrofit2.http.Path

interface RegistrationServices {

    @POST("register")
    fun registerDevice(@Body registration : Registration) : Completable

    @DELETE("register/{id}")
    fun deleteRegistration(@Path("id") id : String) : Completable

}

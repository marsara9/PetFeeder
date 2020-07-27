package com.sdoras.petfeeder.settings.services

import com.sdoras.petfeeder.settings.models.Settings
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single
import retrofit2.http.DELETE
import retrofit2.http.GET
import retrofit2.http.PUT
import retrofit2.http.Query

interface SettingsServices {

    @GET("settings")
    fun getSettings() : Single<Settings>

    @PUT("settings")
    fun setSettings(@Query("ssid") ssid : String? = null,
                    @Query("password") password : String? = null,
                    @Query("nickname") nickname: String? = null) : Completable

    @DELETE("settings")
    fun deleteSettings() : Completable
}

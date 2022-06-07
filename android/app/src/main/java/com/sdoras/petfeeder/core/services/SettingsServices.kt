package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.models.Settings
import retrofit2.Response
import retrofit2.http.DELETE
import retrofit2.http.GET
import retrofit2.http.PUT
import retrofit2.http.Query

interface SettingsServices {

    @GET("settings")
    suspend fun getSettings() : Settings

    @PUT("settings")
    suspend fun setSettings(@Query("ssid") ssid : String? = null,
                    @Query("password") password : String? = null,
                    @Query("name") name: String? = null,
                    @Query("fcm_fingerprint") fingerprint : String? = null
    ) : Response<Unit>

    @DELETE("settings")
    suspend fun deleteSettings() : Response<Unit>
}

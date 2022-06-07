package com.sdoras.petfeeder.core.services.retrofit

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.sdoras.petfeeder.core.utils.GsonISO8601Deserializer
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.*

class ServiceCall(baseUrl: String) {

    companion object {
        private const val ISO8601 = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    }

    private val retrofit: Retrofit = Retrofit.Builder()
            .baseUrl(baseUrl)
            .addConverterFactory(GsonConverterFactory.create(gson()))
            .build()

    private fun gson(): Gson {
        return GsonBuilder()
                .setDateFormat(ISO8601)
                .registerTypeAdapter(Date::class.java, GsonISO8601Deserializer())
                .create()
    }

    fun <T> create(service: Class<T>): T {
        return retrofit.create(service)
    }
}

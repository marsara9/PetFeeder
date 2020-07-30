package com.sdoras.petfeeder.core.services

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.sdoras.petfeeder.core.utils.GsonISO8601Deserializer
import retrofit2.Retrofit
import retrofit2.adapter.rxjava3.RxJava3CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import java.util.*

class ServiceCall(baseUrl : String) {

    private val retrofit : Retrofit = Retrofit.Builder()
            .baseUrl(baseUrl)
            .addConverterFactory(GsonConverterFactory.create(gson()))
            .addCallAdapterFactory(RxJava3CallAdapterFactory.create())
            .build()

    private fun gson() : Gson {
        return GsonBuilder()
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
                .registerTypeAdapter(Date::class.java, GsonISO8601Deserializer())
                .create()
    }

    fun <T> create(service : Class<T>) : T {
        return retrofit.create(service)
    }

}

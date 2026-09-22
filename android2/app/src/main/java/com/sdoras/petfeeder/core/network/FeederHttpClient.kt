package com.sdoras.petfeeder.core.network

import java.util.concurrent.TimeUnit
import kotlinx.serialization.json.Json
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Response
import okhttp3.logging.HttpLoggingInterceptor

/** Throws a [FeederApiException] for non-2xx responses so callers never have to check status codes by hand. */
private class FeederErrorInterceptor(private val json: Json) : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        val response = chain.proceed(chain.request())
        if (!response.isSuccessful) {
            val bodyString = response.body.string()
            response.close()
            throw FeederErrorParser.parse(json, response.code, bodyString)
        }
        return response
    }
}

/** Shared base OkHttp configuration (timeouts, error parsing, debug logging) for every feeder client. */
object FeederHttpClient {
    fun newBuilder(json: Json = NetworkJson, debugLogging: Boolean = false): OkHttpClient.Builder {
        val builder = OkHttpClient.Builder()
            .connectTimeout(10, TimeUnit.SECONDS)
            .readTimeout(10, TimeUnit.SECONDS)
            .writeTimeout(10, TimeUnit.SECONDS)
            .addInterceptor(FeederErrorInterceptor(json))
        if (debugLogging) {
            builder.addInterceptor(HttpLoggingInterceptor().apply { level = HttpLoggingInterceptor.Level.BODY })
        }
        return builder
    }
}

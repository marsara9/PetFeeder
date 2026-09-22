package com.sdoras.petfeeder.core.network

import com.sdoras.petfeeder.core.feeder.Feeder
import java.util.concurrent.ConcurrentHashMap
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import retrofit2.Retrofit
import retrofit2.converter.kotlinx.serialization.asConverterFactory

/**
 * Builds/caches a distinct [Retrofit] instance per feeder id (never a single shared instance with a
 * host-rewriting interceptor), so each feeder's client is isolated and reused across calls.
 */
class FeederApiClientFactory(
    private val json: Json = NetworkJson,
    private val debugLogging: Boolean = false,
) {
    private val retrofitCache = ConcurrentHashMap<String, Retrofit>()

    fun retrofitFor(feeder: Feeder): Retrofit =
        retrofitCache.getOrPut(feeder.id) { buildRetrofit(feeder.host) }

    fun <T> serviceFor(feeder: Feeder, serviceClass: Class<T>): T =
        retrofitFor(feeder).create(serviceClass)

    private fun buildRetrofit(host: String): Retrofit {
        val baseUrl = if (host.endsWith("/")) host else "$host/"
        val contentType = "application/json".toMediaType()
        return Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(FeederHttpClient.newBuilder(json, debugLogging).build())
            .addConverterFactory(json.asConverterFactory(contentType))
            .build()
    }
}

inline fun <reified T> FeederApiClientFactory.serviceFor(feeder: Feeder): T = serviceFor(feeder, T::class.java)

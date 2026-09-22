package com.sdoras.petfeeder.core.network

import kotlinx.serialization.json.Json

/** Single shared [Json] instance/configuration used by every Retrofit client. */
val NetworkJson: Json = Json {
    ignoreUnknownKeys = true
    isLenient = true
    encodeDefaults = true
}

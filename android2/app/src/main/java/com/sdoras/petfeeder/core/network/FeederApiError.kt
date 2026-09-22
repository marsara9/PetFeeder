package com.sdoras.petfeeder.core.network

import java.io.IOException
import kotlinx.serialization.SerializationException
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json

/** Body shape returned by the device on error: `{"error":{"code":<int>,"message":"..."}}`. */
@Serializable
data class ApiErrorEnvelope(val error: ApiErrorBody)

@Serializable
data class ApiErrorBody(val code: Int, val message: String)

/** Typed exception feature code can pattern-match on for device error responses. */
class FeederApiException(val code: Int, message: String) : IOException(message)

/** Parses the device's error-body shape into a [FeederApiException], or null if it doesn't match. */
object FeederErrorParser {
    fun parse(json: Json, httpStatusCode: Int, body: String?): FeederApiException {
        if (!body.isNullOrBlank()) {
            try {
                val envelope = json.decodeFromString(ApiErrorEnvelope.serializer(), body)
                return FeederApiException(envelope.error.code, envelope.error.message)
            } catch (_: SerializationException) {
                // Fall through to the generic exception below.
            }
        }
        return FeederApiException(httpStatusCode, "Unexpected error (HTTP $httpStatusCode)")
    }
}

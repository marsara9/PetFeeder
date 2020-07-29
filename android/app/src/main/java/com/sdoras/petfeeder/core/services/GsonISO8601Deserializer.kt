package com.sdoras.petfeeder.core.services

import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import java.lang.Exception
import java.lang.reflect.Type
import java.text.ParseException
import java.text.SimpleDateFormat
import java.time.Instant
import java.util.*

class GsonISO8601Deserializer  : JsonDeserializer<Date?> {
    override fun deserialize(jsonElement: JsonElement?, typeOF: Type?, context: JsonDeserializationContext?): Date? {
        if (jsonElement == null) {
            return null
        }

        try {
            val instant = Instant.parse(jsonElement.asString)
            return Date.from(instant)
        } catch(ex : Exception) {

        }
        return null
    }
}

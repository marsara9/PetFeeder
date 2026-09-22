package com.sdoras.petfeeder.core.network

import java.time.Instant
import java.time.LocalTime
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

class DeviceTimeSerializersTest {

    @Test
    fun `parses and formats the device's UTC ISO-8601 timestamp`() {
        val raw = "2026-09-21T12:00:00Z"

        val parsed = Json.decodeFromString(UtcInstantSerializer, "\"$raw\"")

        assertEquals(Instant.parse(raw), parsed)
        assertEquals("\"$raw\"", Json.encodeToString(UtcInstantSerializer, parsed))
    }

    @Test
    fun `parses and formats the device's HH-MM schedule time`() {
        val raw = "07:30"

        val parsed = Json.decodeFromString(ScheduleTimeSerializer, "\"$raw\"")

        assertEquals(LocalTime.of(7, 30), parsed)
        assertEquals("\"$raw\"", Json.encodeToString(ScheduleTimeSerializer, parsed))
    }
}

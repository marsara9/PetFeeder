package com.sdoras.petfeeder.core.network

import java.time.Instant
import java.time.LocalTime
import java.time.format.DateTimeFormatter
import kotlinx.serialization.KSerializer
import kotlinx.serialization.descriptors.PrimitiveKind
import kotlinx.serialization.descriptors.PrimitiveSerialDescriptor
import kotlinx.serialization.descriptors.SerialDescriptor
import kotlinx.serialization.encoding.Decoder
import kotlinx.serialization.encoding.Encoder

/** The device reports all timestamps as UTC ISO-8601, e.g. `2026-09-21T12:00:00Z`. */
object UtcInstantSerializer : KSerializer<Instant> {
    override val descriptor: SerialDescriptor = PrimitiveSerialDescriptor("Instant", PrimitiveKind.STRING)
    override fun serialize(encoder: Encoder, value: Instant) = encoder.encodeString(value.toString())
    override fun deserialize(decoder: Decoder): Instant = Instant.parse(decoder.decodeString())
}

/** The device reports schedule times as plain `HH:MM`, with no timezone (device does zero conversion). */
object ScheduleTimeSerializer : KSerializer<LocalTime> {
    private val formatter: DateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm")
    override val descriptor: SerialDescriptor = PrimitiveSerialDescriptor("ScheduleTime", PrimitiveKind.STRING)
    override fun serialize(encoder: Encoder, value: LocalTime) = encoder.encodeString(value.format(formatter))
    override fun deserialize(decoder: Decoder): LocalTime = LocalTime.parse(decoder.decodeString(), formatter)
}

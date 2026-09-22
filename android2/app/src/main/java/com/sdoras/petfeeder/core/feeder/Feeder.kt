package com.sdoras.petfeeder.core.feeder

/** A single paired feeder device. */
data class Feeder(
    val id: String,
    val displayName: String,
    val host: String,
)

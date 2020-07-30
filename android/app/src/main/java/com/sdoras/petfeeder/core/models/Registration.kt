package com.sdoras.petfeeder.core.models

import java.util.*

data class Registration(
        val id: UUID,
        val token: String,
        val deviceType: String
)

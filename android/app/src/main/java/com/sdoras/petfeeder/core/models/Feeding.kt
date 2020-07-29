package com.sdoras.petfeeder.core.models

import java.util.*

data class Feeding(
        val id : UUID,
        val cups : Double,
        val date: Date
)

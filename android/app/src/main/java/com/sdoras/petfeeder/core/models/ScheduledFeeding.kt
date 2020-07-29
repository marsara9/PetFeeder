package com.sdoras.petfeeder.core.models

import java.util.*

data class ScheduledFeeding(
        val id : UUID,
        val cups : Float,
        val hour : Byte,
        val minute : Byte)

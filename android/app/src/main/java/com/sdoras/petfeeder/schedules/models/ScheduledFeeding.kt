package com.sdoras.petfeeder.schedules.models

data class ScheduledFeeding(
        val id : String,
        val cups : Float,
        val hour : Byte,
        val minute : Byte)

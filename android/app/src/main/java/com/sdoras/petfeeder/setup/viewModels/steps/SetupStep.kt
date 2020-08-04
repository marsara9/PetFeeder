package com.sdoras.petfeeder.setup.viewModels.steps

import android.content.Context

interface SetupStep {
    val message : String
    val image : Int?

    fun onStart(context: Context)
}

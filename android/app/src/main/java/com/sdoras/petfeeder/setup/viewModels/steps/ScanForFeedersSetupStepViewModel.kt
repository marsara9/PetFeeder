package com.sdoras.petfeeder.setup.viewModels.steps

import android.content.Context
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel

interface ScanForFeedersSetupStepViewModel : SetupStepViewModel {
    val status : LiveData<Int>
    val message : LiveData<Int>
    val isTryAgainVisible : LiveData<Boolean>
    val ssids : LiveData<List<String>>

    val selectedSSID : String?

    fun tryAgain(context: Context)

    fun next()
}

package com.sdoras.petfeeder.setup.viewModels.steps

import android.net.MacAddress
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel

interface ConnectToAccessPointSetupStepViewModel : SetupStepViewModel {
    val ssid : LiveData<String>

    fun setSSID(ssid : String, bssid: MacAddress? = null)
}

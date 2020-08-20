package com.sdoras.petfeeder.setup.viewModels.steps

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel

interface ConfigureFeederSetupStepViewModel : SetupStepViewModel {

    val ssid : MutableLiveData<String>
    val password : MutableLiveData<String>
    val name : MutableLiveData<String>

}

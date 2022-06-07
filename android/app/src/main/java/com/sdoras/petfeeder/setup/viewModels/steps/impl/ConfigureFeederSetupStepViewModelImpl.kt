package com.sdoras.petfeeder.setup.viewModels.steps.impl

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.setup.viewModels.steps.ConfigureFeederSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import kotlinx.coroutines.launch

class ConfigureFeederSetupStepViewModelImpl(
        private val settingsRepository: SettingsRepository
) : AbstractSetupStepViewModel(), ConfigureFeederSetupStepViewModel {

    override val ssid = MutableLiveData<String>()
    override val password = MutableLiveData<String>()
    override val name = MutableLiveData<String>()

    fun onNext() {

        val ssid = ssid.value
        val password = password.value
        val name = name.value

        requireNotNull(ssid)

        viewModelScope.launch {
            settingsRepository.setWifiSettings(ssid, password)
            name?.let {
                settingsRepository.setFeederName(it)
            }
            delegate?.goToNextStep()
        }
    }
}

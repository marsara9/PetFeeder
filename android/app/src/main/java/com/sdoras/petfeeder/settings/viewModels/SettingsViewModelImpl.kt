package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.asLiveData
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch

class SettingsViewModelImpl(
        private val settingsRepository: SettingsRepository,
        notificationServices: NotificationServices
) : AbstractViewModel(), SettingsViewModel {

    override val ssid = settingsRepository.get()
            .map { it?.ssid ?: "" }
            .asLiveData()

    override val name = settingsRepository.get()
            .map { it?.name ?: "" }
            .asLiveData()

    override val cloudMessagingToken = MutableLiveData<String>()
    override val showCloudMessagingToken = MutableLiveData(true)

    init {
        viewModelScope.launch {
            cloudMessagingToken.value = notificationServices.getCloudMessagingToken()
        }
    }

    override fun setWifi(ssid: String, password: String?) {
        viewModelScope.launch {
            settingsRepository.setWifiSettings(ssid, password)
        }
    }

    override fun setName(name: String) {
        viewModelScope.launch {
            settingsRepository.setFeederName(name)
        }
    }

    override fun restoreFactoryDefaults() {
        viewModelScope.launch {
            settingsRepository.deleteSettings()
        }
    }
}

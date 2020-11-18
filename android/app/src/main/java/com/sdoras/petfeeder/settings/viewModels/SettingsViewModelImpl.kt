package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel

class SettingsViewModelImpl(
        private val settingsRepository: SettingsRepository,
        notificationServices: NotificationServices
) : AbstractViewModel(), SettingsViewModel {

    override val ssid = MutableLiveData<String>()
    override val name = MutableLiveData<String>()
    override val cloudMessagingToken = MutableLiveData<String>()
    override val showCloudMessagingToken = MutableLiveData<Boolean>()

    init {
        showCloudMessagingToken.value = true

        disposables.add(settingsRepository.get()
                .subscribe({
                    ssid.value = it.ssid
                    name.value = it.name
                }, {

                }))

        disposables.add(notificationServices.getCloudMessagingToken()
                .compose(applyDefaultSingleRxSettings())
                .subscribe(cloudMessagingToken::setValue) {

                })
    }

    override fun setWifi(ssid: String, password: String?) {
        disposables.add(settingsRepository.setWiFiSettings(ssid, password)
                ?.andThen(settingsRepository.refresh())
                ?.subscribe())
    }

    override fun setName(name: String) {
        disposables.add(settingsRepository.setFeederName(name)
                ?.andThen(settingsRepository.refresh())
                ?.subscribe())
    }

    override fun restoreFactoryDefaults() {
        disposables.add(settingsRepository.deleteSettings()
                ?.andThen(settingsRepository.refresh())
                ?.subscribe())
    }
}

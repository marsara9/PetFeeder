package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.schedulers.Schedulers

class SettingsViewModelImpl(
        private val settingsRepository: SettingsRepository,
        notificationServices: NotificationServices
) : ViewModel(), SettingsViewModel {

    override val showLoading = MutableLiveData<Int>()
    override val ssid = MutableLiveData<String>()
    override val name = MutableLiveData<String>()
    override val cloudMessagingToken = MutableLiveData<String>()
    override val showCloudMessagingToken = MutableLiveData<Boolean>()

    init {
        showCloudMessagingToken.value = true

        settingsRepository.get()
                .subscribe({
                    ssid.value = it.ssid
                    name.value = it.name
                }, {

                })

        notificationServices.getCloudMessagingToken()
                .compose(applyDefaultSingleRxSettings())
                .subscribe({
                    cloudMessagingToken.value = it
                }, {

                })
    }

    override fun setWifi(ssid: String, password: String?) {
        settingsRepository.setWiFiSettings(ssid, password)
                ?.andThen(settingsRepository.refresh())
                ?.subscribe()
    }

    override fun setName(name: String) {
        settingsRepository.setFeederName(name)
                ?.andThen(settingsRepository.refresh())
                ?.subscribe()
    }

    override fun restoreFactoryDefaults() {
        settingsRepository.deleteSettings()
                ?.andThen(settingsRepository.refresh())
                ?.subscribe()
    }
}

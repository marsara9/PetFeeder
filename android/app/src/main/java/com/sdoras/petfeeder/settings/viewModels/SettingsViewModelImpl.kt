package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.SettingsServices
import io.reactivex.rxjava3.core.Completable

class SettingsViewModelImpl(private val settingsServices: SettingsServices, notificationServices: NotificationServices) : ViewModel(), SettingsViewModel {

    override val showLoading = MutableLiveData<Int>()
    override val ssid = MutableLiveData<String>()
    override val name = MutableLiveData<String>()
    override val cloudMessagingToken = MutableLiveData<String>()
    override val showCloudMessagingToken = MutableLiveData<Boolean>()

    init {
        showCloudMessagingToken.value = true

        refresh()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()

        notificationServices.getCloudMessagingToken()
                .compose(applyDefaultSingleRxSettings())
                .subscribe({
                    cloudMessagingToken.value = it
                }, {

                })
    }

    private fun refresh() : Completable {
        return settingsServices.getSettings()
                .doOnSuccess {
                    ssid.postValue(it.ssid)
                    name.postValue(it.name)
                }.ignoreElement()
    }

    override fun setWifi(ssid: String, password: String?) {
        settingsServices.setSettings(ssid = ssid, password = password)
                .compose(applyDefaultCompletableRxSettings())
                .andThen(refresh())
                .subscribe()
    }

    override fun setName(name: String) {
        settingsServices.setSettings(name = name)
                .compose(applyDefaultCompletableRxSettings())
                .andThen(refresh())
                .subscribe()
    }

    override fun restoreFactoryDefaults() {
        settingsServices.deleteSettings()
                .compose(applyDefaultCompletableRxSettings())
                .andThen(refresh())
                .subscribe()
    }
}

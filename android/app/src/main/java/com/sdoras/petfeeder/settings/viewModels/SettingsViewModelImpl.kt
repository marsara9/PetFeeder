package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.settings.services.SettingsServices
import io.reactivex.rxjava3.core.Completable

class SettingsViewModelImpl(private val settingsServices: SettingsServices) : ViewModel(), SettingsViewModel {

    override val showLoading = MutableLiveData<Boolean>()
    override val ssid = MutableLiveData<String>()
    override val name = MutableLiveData<String>()

    init {
        refresh()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()
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

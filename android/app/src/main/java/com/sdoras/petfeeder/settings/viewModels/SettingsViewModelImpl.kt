package com.sdoras.petfeeder.settings.viewModels

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.settings.services.SettingsServices
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.schedulers.Schedulers

class SettingsViewModelImpl(private val settingsServices: SettingsServices) : ViewModel(), SettingsViewModel {

    override val showLoading = MutableLiveData<Boolean>()
    override val ssid = MutableLiveData<String>()
    override val name = MutableLiveData<String>()

    init {
        refresh()
    }

    override fun refresh() {
        settingsServices.getSettings()
                .doOnSubscribe { showLoading.postValue(true) }
                .doAfterTerminate { showLoading.postValue(false) }
                .observeOn(Schedulers.io())
                .subscribeOn(AndroidSchedulers.mainThread())
                .subscribe({
                    ssid.postValue(it.ssid)
                    name.postValue(it.name)
                }, {
                    Log.e("", "", it);
                })
    }

    override fun setWifi(ssid: String, password: String?) {
        this.ssid.postValue(ssid)
        settingsServices.setSettings(ssid = ssid, password = password)
    }

    override fun setName(name: String) {
        this.name.postValue(name)
        settingsServices.setSettings(name = name)
                .doOnSubscribe { showLoading.postValue(true) }
                .doAfterTerminate { showLoading.postValue(false) }
                .observeOn(Schedulers.io())
                .subscribe()
    }

    override fun restoreFactoryDefaults() {
        settingsServices.deleteSettings()
                .doOnSubscribe { showLoading.postValue(true) }
                .doAfterTerminate { showLoading.postValue(false) }
                .observeOn(Schedulers.io())
                .subscribe()
    }
}

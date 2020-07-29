package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import io.reactivex.rxjava3.core.Completable

interface SettingsViewModel : BaseViewModel {

    val ssid : LiveData<String>
    val name : LiveData<String>

    fun setWifi(ssid : String, password : String?)

    fun setName(name: String)

    fun restoreFactoryDefaults()

}

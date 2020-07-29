package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SettingsViewModel : BaseViewModel {

    val ssid : LiveData<String>
    val name : LiveData<String>
    val cloudMessagingToken : LiveData<String>

    fun setWifi(ssid : String, password : String?)

    fun setName(name: String)

    fun restoreFactoryDefaults()

}

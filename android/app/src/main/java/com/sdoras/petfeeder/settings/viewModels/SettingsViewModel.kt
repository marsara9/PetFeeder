package com.sdoras.petfeeder.settings.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SettingsViewModel : BaseViewModel {

    override val showLoading : LiveData<Boolean>

    val ssid : LiveData<String>
    val name : LiveData<String>

    fun setWifi(ssid : String, password : String)

    fun setName(name: String)

    fun restoreFactoryDefaults()
}

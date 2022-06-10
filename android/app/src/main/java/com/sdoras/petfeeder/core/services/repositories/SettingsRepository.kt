package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.models.Settings
import com.sdoras.petfeeder.core.services.repositories.base.Repository

interface SettingsRepository : Repository<Settings> {

    suspend fun get(url : String) : Settings

    suspend fun setWifiSettings(ssid : String, password : String?)

    suspend fun setFeederName(name: String)

    suspend fun setNotificationsApiKey(fingerprint : String)

    suspend fun deleteSettings()
}

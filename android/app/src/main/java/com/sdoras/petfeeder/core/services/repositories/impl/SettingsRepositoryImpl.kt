package com.sdoras.petfeeder.core.services.repositories.impl

import com.sdoras.petfeeder.core.models.Settings
import com.sdoras.petfeeder.core.services.SettingsServices
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.services.repositories.base.AbstractFeederRepository
import com.sdoras.petfeeder.core.services.retrofit.ServiceCall
import kotlinx.coroutines.flow.first

class SettingsRepositoryImpl(
        feederUrlRepository: FeederUrlRepository
) : AbstractFeederRepository<SettingsServices, Settings?>(
        feederUrlRepository, null
), SettingsRepository {

    override fun getServiceClass(): Class<SettingsServices> {
        return SettingsServices::class.java
    }

    override suspend fun invokeServiceCall(service: SettingsServices): Settings {
        return service.getSettings()
    }

    override suspend fun get(url: String): Settings {
        return ServiceCall(url).create(getServiceClass())
                .getSettings()
    }

    override suspend fun setWifiSettings(ssid: String, password: String?) {
        checkNotNull(getService().first())
                .setSettings(ssid = ssid, password = password)
    }

    override suspend fun setFeederName(name: String) {
        checkNotNull(getService().first())
                .setSettings(name = name)
    }

    override suspend fun setNotificationsApiKey(fingerprint: String) {
        checkNotNull(getService().first())
                .setSettings(fingerprint = fingerprint)
    }

    override suspend fun deleteSettings() {
        checkNotNull(getService().first())
                .deleteSettings()
    }
}

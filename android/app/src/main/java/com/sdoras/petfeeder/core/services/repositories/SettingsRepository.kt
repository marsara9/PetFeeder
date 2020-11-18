package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.models.Settings
import com.sdoras.petfeeder.core.services.ServiceCall
import com.sdoras.petfeeder.core.services.SettingsServices
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single

class SettingsRepository(feederUrlRepository: FeederUrlRepository) : AbstractRxRepository<SettingsServices, Settings>(feederUrlRepository) {

    override fun getServiceClass(): Class<SettingsServices> {
        return SettingsServices::class.java
    }

    override fun getServiceCall(service: SettingsServices): Single<Settings> {
        return service.getSettings()
    }

    fun setWiFiSettings(ssid : String, password : String? = null) : Completable? {
        return service?.setSettings(ssid, password)
    }

    fun setFeederName(name: String) : Completable? {
        return service?.setSettings(name = name)
    }

    fun updateFeederFCMFingerprint(fingerprint : String) : Completable? {
        return service?.setSettings(fingerprint = fingerprint)
    }

    fun deleteSettings() : Completable? {
        return service?.deleteSettings()
    }

    fun get(feederUrl : String) : Single<Settings> {
        return ServiceCall(feederUrl).create(getServiceClass()).getSettings()
    }
}

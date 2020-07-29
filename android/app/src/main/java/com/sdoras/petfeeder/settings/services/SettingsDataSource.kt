package com.sdoras.petfeeder.settings.services

import io.reactivex.rxjava3.core.Single

interface SettingsDataSource {

    fun getCloudMessagingToken() : Single<String>

}

package com.sdoras.petfeeder.core.services

import io.reactivex.rxjava3.core.Single
import java.util.*

interface NotificationServices {
    fun getCloudMessagingToken() : Single<String>

    fun getDeviceId() : UUID

    fun isNotificationTokenUpdated() : Boolean
    fun setTokenUpdated(boolean: Boolean)
}

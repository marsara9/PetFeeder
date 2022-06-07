package com.sdoras.petfeeder.core.services

import java.util.*

interface NotificationServices {
    suspend fun getCloudMessagingToken(): String

    fun getDeviceId(): UUID

    fun isNotificationTokenUpdated(): Boolean
    fun setTokenUpdated(boolean: Boolean)
}

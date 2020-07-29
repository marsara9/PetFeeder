package com.sdoras.petfeeder.core.notifications

import android.content.Context
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

class FirebaseMessagingServiceImpl : FirebaseMessagingService() {

    override fun onNewToken(token: String) {
        super.onNewToken(token)

        getSharedPreferences("petFeeder", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("tokenUpdated", true)
                .apply()
    }

    override fun onMessageReceived(message: RemoteMessage) {
        super.onMessageReceived(message)
    }

}

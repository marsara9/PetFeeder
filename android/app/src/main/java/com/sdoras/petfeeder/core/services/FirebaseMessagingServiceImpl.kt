package com.sdoras.petfeeder.core.services

import com.google.firebase.messaging.FirebaseMessagingService

class FirebaseMessagingServiceImpl : FirebaseMessagingService() {

    override fun onNewToken(token: String) {
        super.onNewToken(token)
    }

}

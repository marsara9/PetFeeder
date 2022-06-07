package com.sdoras.petfeeder.core.services

import android.app.Application
import android.content.Context
import com.google.firebase.messaging.FirebaseMessaging
import java.util.*
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine

class NotificationServicesImpl(
        private val application: Application
) : NotificationServices {

    companion object {
        private const val SHARED_PREFERENCES_NAME = "petFeeder"
    }

    override suspend fun getCloudMessagingToken(): String {
        return suspendCoroutine { continuation ->
            FirebaseMessaging.getInstance().token
                    .addOnCompleteListener { task ->
                        if(!task.isSuccessful) {
                            task.exception?.let {
                                continuation.resumeWithException(it)
                            } ?: continuation.resumeWithException(
                                    Exception("Unknown Error fetching cloud messaging token.")
                            )
                        } else {
                            continuation.resume(task.result)
                        }
                    }
            }
        }

//    override fun getCloudMessagingToken(): Single<String> {
//        return Single.create{ emitter ->
//            FirebaseMessaging.getInstance().token
//                    .addOnCompleteListener(OnCompleteListener { task ->
//                        if (!task.isSuccessful) {
//                            task.exception?.let { exception ->
//                                emitter.onError(exception)
//                            }
//                            return@OnCompleteListener
//                        }
//
//                        emitter.onSuccess(task.result)
//                    })
//        }
//    }

    override fun getDeviceId(): UUID {

        val sharedPreferences = application.getSharedPreferences(SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE)

        var deviceId = sharedPreferences
                .getString("deviceId", null)

        if(deviceId == null) {
            deviceId = UUID.randomUUID().toString()
            sharedPreferences.edit()
                    .putString("deviceId", deviceId)
                    .apply()
        }
        return UUID.fromString(deviceId)
    }

    override fun isNotificationTokenUpdated() : Boolean {
        return application.getSharedPreferences(SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE)
                .getBoolean("tokenUpdated", true)
    }

    override fun setTokenUpdated(boolean: Boolean) {
        application.getSharedPreferences(SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE)
                .edit()
                .putBoolean("tokenUpdated", boolean)
                .apply()
    }
}

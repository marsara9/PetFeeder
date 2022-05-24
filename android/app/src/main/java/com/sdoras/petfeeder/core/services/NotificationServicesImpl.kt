package com.sdoras.petfeeder.core.services

import android.app.Application
import android.content.Context
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.messaging.FirebaseMessaging
import io.reactivex.rxjava3.core.Single
import java.util.*


class NotificationServicesImpl(
        private val application: Application
) : NotificationServices {

    companion object {
        private const val SHARED_PREFERENCES_NAME = "petFeeder"
    }

    override fun getCloudMessagingToken(): Single<String> {
        return Single.create{ emitter ->
            FirebaseMessaging.getInstance().token
                    .addOnCompleteListener(OnCompleteListener { task ->
                        if (!task.isSuccessful) {
                            task.exception?.let { exception ->
                                emitter.onError(exception)
                            }
                            return@OnCompleteListener
                        }

                        emitter.onSuccess(task.result)
                    })
        }
    }

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

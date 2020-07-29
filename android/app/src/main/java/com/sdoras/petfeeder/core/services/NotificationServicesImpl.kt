package com.sdoras.petfeeder.core.services

import android.app.Application
import android.content.Context
import android.util.Log
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.iid.FirebaseInstanceId
import io.reactivex.rxjava3.core.Single
import java.util.*

class NotificationServicesImpl(private val application: Application) : NotificationServices {

    companion object {
        private const val SHARED_PREFERENCES_NAME = "petFeeder";
    }

    override fun getCloudMessagingToken(): Single<String> {
        return Single.create{ emitter ->
            FirebaseInstanceId.getInstance().instanceId.addOnCompleteListener(OnCompleteListener { task ->
                if(!task.isSuccessful) {
                    emitter.onError(task.exception)
                    return@OnCompleteListener
                }

                task.result?.token?.let {
                    Log.d("Settings", it)
                    emitter.onSuccess(it)
                } ?: emitter.onError(task.exception)
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

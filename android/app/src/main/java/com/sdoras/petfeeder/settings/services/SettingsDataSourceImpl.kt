package com.sdoras.petfeeder.settings.services

import android.util.Log
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.iid.FirebaseInstanceId
import io.reactivex.rxjava3.core.Single

class SettingsDataSourceImpl : SettingsDataSource {

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
}

package com.sdoras.petfeeder.core

import android.app.Application
import com.sdoras.petfeeder.schedules.schedulesModule
import com.sdoras.petfeeder.settings.settingsModule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin

class PetFeederApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@PetFeederApplication)
            modules(listOf(settingsModule(), schedulesModule()))
        }
    }
}

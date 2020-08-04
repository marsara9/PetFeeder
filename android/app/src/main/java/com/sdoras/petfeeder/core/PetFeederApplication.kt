package com.sdoras.petfeeder.core

import android.app.Application
import com.sdoras.petfeeder.core.services.servicesModule
import com.sdoras.petfeeder.dashboard.dashboardModule
import com.sdoras.petfeeder.history.historyModule
import com.sdoras.petfeeder.main.mainModule
import com.sdoras.petfeeder.schedules.schedulesModule
import com.sdoras.petfeeder.settings.settingsModule
import com.sdoras.petfeeder.setup.setupModule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin

class PetFeederApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@PetFeederApplication)
            modules(listOf(
                    mainModule(),
                    setupModule(),
                    servicesModule(),
                    dashboardModule(),
                    settingsModule(),
                    schedulesModule(),
                    historyModule()
            ))
        }
    }


}

package com.sdoras.petfeeder.core

import android.app.Application
import com.sdoras.petfeeder.core.services.ServiceCall
import com.sdoras.petfeeder.settings.services.SettingsServices
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModel
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import com.sdoras.petfeeder.settings.views.SettingsClickHandler
import com.sdoras.petfeeder.settings.views.SettingsClickHandlerImpl
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.context.startKoin
import org.koin.dsl.module

class PetFeederApplication : Application() {

    companion object {
        private val module = module {
            single { ServiceCall("http://192.168.86.204").create(SettingsServices::class.java) }
            viewModel { SettingsViewModelImpl(get()) }
            single<SettingsClickHandler> { SettingsClickHandlerImpl() }
        }
    }

    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@PetFeederApplication)
            modules(module)
        }
    }
}

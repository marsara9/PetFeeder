package com.sdoras.petfeeder.settings

import com.sdoras.petfeeder.core.services.ServiceCall
import com.sdoras.petfeeder.settings.services.SettingsDataSource
import com.sdoras.petfeeder.settings.services.SettingsDataSourceImpl
import com.sdoras.petfeeder.settings.services.SettingsServices
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import com.sdoras.petfeeder.settings.views.SettingsClickHandler
import com.sdoras.petfeeder.settings.views.SettingsClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun settingsModule() : Module {
    return module {
        single { ServiceCall("http://192.168.86.204").create(SettingsServices::class.java) }
        single<SettingsDataSource> { SettingsDataSourceImpl() }
        viewModel { SettingsViewModelImpl(get(), get()) }
        single<SettingsClickHandler> { args -> SettingsClickHandlerImpl(args[0]) }
    }
}

package com.sdoras.petfeeder.settings

import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import com.sdoras.petfeeder.settings.views.SettingsClickHandler
import com.sdoras.petfeeder.settings.views.SettingsClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun settingsModule() : Module {
    return module {
        viewModel { SettingsViewModelImpl(get(), get()) }
        single<SettingsClickHandler> { args -> SettingsClickHandlerImpl(args[0]) }
    }
}

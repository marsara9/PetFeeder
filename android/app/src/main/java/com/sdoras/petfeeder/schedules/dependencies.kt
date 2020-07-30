package com.sdoras.petfeeder.schedules

import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModelImpl
import com.sdoras.petfeeder.schedules.views.SchedulesClickHandler
import com.sdoras.petfeeder.schedules.views.SchedulesClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun schedulesModule() : Module {
    return module {
        viewModel { SchedulesViewModelImpl(get()) }
        single<SchedulesClickHandler> { args -> SchedulesClickHandlerImpl(args[0]) }
    }
}

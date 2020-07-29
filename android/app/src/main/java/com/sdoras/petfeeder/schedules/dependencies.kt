package com.sdoras.petfeeder.schedules

import com.sdoras.petfeeder.core.services.ServiceCall
import com.sdoras.petfeeder.schedules.services.ScheduleServices
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModelImpl
import com.sdoras.petfeeder.schedules.views.SchedulesClickHandler
import com.sdoras.petfeeder.schedules.views.SchedulesClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun schedulesModule() : Module {
    return module {
        single { ServiceCall("http://192.168.86.204").create(ScheduleServices::class.java) }
        viewModel { SchedulesViewModelImpl(get()) }
        single<SchedulesClickHandler> { args -> SchedulesClickHandlerImpl(args[0]) }
    }
}

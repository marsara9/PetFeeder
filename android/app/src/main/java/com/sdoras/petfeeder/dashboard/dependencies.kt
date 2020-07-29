package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.core.services.ServiceCall
import com.sdoras.petfeeder.dashboard.viewModels.DashboardViewModelImpl
import com.sdoras.petfeeder.history.services.FeedingServices
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun dashboardModule() : Module {
    return module {
        viewModel { DashboardViewModelImpl(get()) }
    }
}

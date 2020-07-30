package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.dashboard.viewModels.DashboardPageViewModelImpl
import com.sdoras.petfeeder.dashboard.viewModels.DashboardViewModelImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun dashboardModule() : Module {
    return module {
        viewModel { DashboardViewModelImpl(get()) }
        viewModel { DashboardPageViewModelImpl(get(), get(), get()) }
    }
}

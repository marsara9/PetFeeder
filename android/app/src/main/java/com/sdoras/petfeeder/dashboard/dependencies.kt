package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.dashboard.viewModels.impl.DashboardPageViewModelImpl
import com.sdoras.petfeeder.dashboard.viewModels.impl.DashboardViewModelImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun dashboardModule() : Module {
    return module {
        viewModel { DashboardViewModelImpl(get(), get(), get()) }
        viewModel { DashboardPageViewModelImpl(get(), get(), get(), get(), get()) }
    }
}

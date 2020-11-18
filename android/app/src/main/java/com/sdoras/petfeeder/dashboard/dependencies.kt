package com.sdoras.petfeeder.dashboard

import com.sdoras.petfeeder.dashboard.viewModels.impl.DashboardPageViewModelImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun dashboardModule() : Module {
    return module {
        viewModel { DashboardPageViewModelImpl(get(), get(), get(), get(), get()) }
    }
}

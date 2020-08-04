package com.sdoras.petfeeder.setup

import com.sdoras.petfeeder.setup.viewModels.SetupViewModelImpl
import com.sdoras.petfeeder.setup.views.SetupClickHandler
import com.sdoras.petfeeder.setup.views.SetupClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

fun setupModule() = module {
    viewModel { SetupViewModelImpl(get(), get()) }
    single<SetupClickHandler> { args -> SetupClickHandlerImpl(args[0]) }
}
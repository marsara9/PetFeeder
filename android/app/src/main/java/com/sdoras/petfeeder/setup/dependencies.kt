package com.sdoras.petfeeder.setup

import com.sdoras.petfeeder.setup.viewModels.impl.SetupViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ConnectToAccessPointSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.impl.IntroductionSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ScanForFeedersSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.SetupClickHandler
import com.sdoras.petfeeder.setup.views.SetupClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

fun setupModule() = module {
    viewModel { SetupViewModelImpl() }
    single<SetupClickHandler> { args -> SetupClickHandlerImpl(args[0]) }

    viewModel { IntroductionSetupStepViewModelImpl(get()) }
    viewModel { ScanForFeedersSetupStepViewModelImpl(get()) }
    viewModel { ConnectToAccessPointSetupStepViewModelImpl(get()) }
}
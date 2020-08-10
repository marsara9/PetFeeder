package com.sdoras.petfeeder.setup

import com.sdoras.petfeeder.setup.viewModels.impl.SetupViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ConnectToAccessPointSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.impl.IntroductionSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ScanForFeedersSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.steps.IntroductionSetupStepClickHandler
import com.sdoras.petfeeder.setup.views.steps.IntroductionSetupStepClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

fun setupModule() = module {
    viewModel { SetupViewModelImpl() }

    viewModel { IntroductionSetupStepViewModelImpl() }
    viewModel { ScanForFeedersSetupStepViewModelImpl(get()) }
    viewModel { ConnectToAccessPointSetupStepViewModelImpl(get()) }

    single<IntroductionSetupStepClickHandler> { args -> IntroductionSetupStepClickHandlerImpl(args[0]) }
}

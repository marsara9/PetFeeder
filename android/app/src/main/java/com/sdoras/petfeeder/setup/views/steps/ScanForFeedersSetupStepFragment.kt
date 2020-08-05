package com.sdoras.petfeeder.setup.views.steps

import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ScanForFeedersSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class ScanForFeedersSetupStepFragment : AbstractSetupStepFragment<ScanForFeedersSetupStepViewModel>() {
    override val viewModel by viewModel<ScanForFeedersSetupStepViewModelImpl>()
    override val clickHandler: ClickHandler<ScanForFeedersSetupStepViewModel>? = null

    class Factory : AbstractSetupStepFragment.Factory<ScanForFeedersSetupStepViewModel> {
        override fun build(): AbstractSetupStepFragment<ScanForFeedersSetupStepViewModel> {
            return ScanForFeedersSetupStepFragment()
        }
    }
}

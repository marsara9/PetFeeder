package com.sdoras.petfeeder.setup.views.steps

import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.impl.IntroductionSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class IntroductionSetupStepFragment : AbstractSetupStepFragment<IntroductionSetupStepViewModel>() {
    override val viewModel by viewModel<IntroductionSetupStepViewModelImpl>()
    override val clickHandler: ClickHandler<IntroductionSetupStepViewModel>? = null

    class Factory : AbstractSetupStepFragment.Factory<IntroductionSetupStepViewModel> {
        override fun build(): AbstractSetupStepFragment<IntroductionSetupStepViewModel> {
            return IntroductionSetupStepFragment()
        }
    }
}

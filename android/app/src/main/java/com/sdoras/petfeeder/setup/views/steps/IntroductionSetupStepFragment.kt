package com.sdoras.petfeeder.setup.views.steps

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.databinding.FragmentSetupStepIntroductionBinding
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.impl.IntroductionSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class IntroductionSetupStepFragment : AbstractSetupStepFragment<IntroductionSetupStepViewModel, FragmentSetupStepIntroductionBinding>() {

    override val layoutId = R.layout.fragment_setup_step_introduction
    override val viewModel by viewModel<IntroductionSetupStepViewModelImpl>()
    override val clickHandler by clickHandler<IntroductionSetupStepClickHandler>()

    class Factory : AbstractSetupStepFragment.Factory<IntroductionSetupStepViewModel, FragmentSetupStepIntroductionBinding> {
        override fun build(): AbstractSetupStepFragment<IntroductionSetupStepViewModel, FragmentSetupStepIntroductionBinding> {
            return IntroductionSetupStepFragment()
        }
    }
}

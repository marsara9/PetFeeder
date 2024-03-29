package com.sdoras.petfeeder.setup.views.steps

import androidx.databinding.ViewDataBinding
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ScanForFeedersSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class ScanForFeedersSetupStepFragment : AbstractSetupStepFragment<ScanForFeedersSetupStepViewModel, ViewDataBinding>() {

    override val layoutId = R.layout.fragment_setup_step_scan
    override val viewModel by viewModel<ScanForFeedersSetupStepViewModelImpl>()
    override val clickHandler by clickHandler<ScanForFeedersSetupStepClickHandler>()

    class Factory : AbstractSetupStepFragment.Factory<ScanForFeedersSetupStepViewModel, ViewDataBinding> {
        override fun build(): AbstractSetupStepFragment<ScanForFeedersSetupStepViewModel, ViewDataBinding> {
            return ScanForFeedersSetupStepFragment()
        }
    }
}

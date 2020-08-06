package com.sdoras.petfeeder.setup.views

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentSetupStepBinding
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel

abstract class AbstractSetupStepFragment<VM : SetupStepViewModel> : DataBoundFragment<VM, FragmentSetupStepBinding>() {
    override val layoutId = R.layout.fragment_setup_step

    interface Factory<VM : SetupStepViewModel> {
        fun build() : AbstractSetupStepFragment<VM>
    }
}

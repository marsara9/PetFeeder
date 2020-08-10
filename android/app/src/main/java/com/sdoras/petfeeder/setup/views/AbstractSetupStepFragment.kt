package com.sdoras.petfeeder.setup.views

import androidx.databinding.ViewDataBinding
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel

abstract class AbstractSetupStepFragment<VM : SetupStepViewModel, Binding : ViewDataBinding> : DataBoundFragment<VM, Binding>() {

    interface Factory<VM : SetupStepViewModel, Binding : ViewDataBinding> {
        fun build() : AbstractSetupStepFragment<VM, Binding>
    }
}

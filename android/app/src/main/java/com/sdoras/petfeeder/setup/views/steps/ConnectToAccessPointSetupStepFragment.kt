package com.sdoras.petfeeder.setup.views.steps

import androidx.databinding.ViewDataBinding
import com.sdoras.petfeeder.setup.viewModels.steps.ConnectToAccessPointSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ConnectToAccessPointSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class ConnectToAccessPointSetupStepFragment : AbstractSetupStepFragment<ConnectToAccessPointSetupStepViewModel, ViewDataBinding>() {

    override val layoutId = 0
    override val setupStepViewModel by viewModel<ConnectToAccessPointSetupStepViewModelImpl>()

    class Factory : AbstractSetupStepFragment.Factory<ConnectToAccessPointSetupStepViewModel, ViewDataBinding> {
        override fun build(): AbstractSetupStepFragment<ConnectToAccessPointSetupStepViewModel, ViewDataBinding> {
            return ConnectToAccessPointSetupStepFragment()
        }
    }
}

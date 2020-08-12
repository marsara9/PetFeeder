package com.sdoras.petfeeder.setup.views.steps

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.databinding.FragmentSetupStepConnectBinding
import com.sdoras.petfeeder.setup.viewModels.steps.ConnectToAccessPointSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.impl.ConnectToAccessPointSetupStepViewModelImpl
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class ConnectToAccessPointSetupStepFragment : AbstractSetupStepFragment<ConnectToAccessPointSetupStepViewModel, FragmentSetupStepConnectBinding>() {

    companion object {
        const val EXTRA_SSID = "ssid";
    }

    override val layoutId = R.layout.fragment_setup_step_connect
    override val viewModel by viewModel<ConnectToAccessPointSetupStepViewModelImpl>()
    override val clickHandler: ClickHandler<ConnectToAccessPointSetupStepViewModel>? = null

    class Factory : AbstractSetupStepFragment.Factory<ConnectToAccessPointSetupStepViewModel, FragmentSetupStepConnectBinding> {
        override fun build(): AbstractSetupStepFragment<ConnectToAccessPointSetupStepViewModel, FragmentSetupStepConnectBinding> {
            return ConnectToAccessPointSetupStepFragment()
        }
    }
}

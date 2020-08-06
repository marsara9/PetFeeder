package com.sdoras.petfeeder.setup.views

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.ViewDataBinding
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel
import com.sdoras.petfeeder.setup.viewModels.impl.SetupViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel
import org.koin.androidx.viewmodel.ext.android.viewModel

abstract class AbstractSetupStepFragment<VM : SetupStepViewModel, Binding : ViewDataBinding> : DataBoundFragment<SetupViewModel, Binding>() {

    final override val viewModel by viewModel<SetupViewModelImpl>()
    final override val clickHandler by clickHandler<SetupClickHandler>()

    abstract val setupStepViewModel : VM

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = super.onCreateView(inflater, container, savedInstanceState)

        binding.setVariable(BR.setupStepViewModel, setupStepViewModel)

        return view
    }

    interface Factory<VM : SetupStepViewModel, Binding : ViewDataBinding> {
        fun build() : AbstractSetupStepFragment<VM, Binding>
    }
}

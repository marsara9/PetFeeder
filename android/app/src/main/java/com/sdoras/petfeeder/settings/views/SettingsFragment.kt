package com.sdoras.petfeeder.settings.views

import android.os.Bundle
import android.view.View
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentSettingsBinding
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import org.koin.android.ext.android.inject
import org.koin.androidx.viewmodel.ext.android.viewModel

class SettingsFragment : DataBoundFragment<FragmentSettingsBinding>() {

    override val layoutId = R.layout.fragment_settings
    override val viewModel by viewModel<SettingsViewModelImpl>()
    override val clickHandler by inject<SettingsClickHandler>()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        clickHandler.viewModel = viewModel
    }
}

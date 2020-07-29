package com.sdoras.petfeeder.settings.views

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentSettingsBinding
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModel
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class SettingsFragment : DataBoundFragment<SettingsViewModel, FragmentSettingsBinding>() {

    override val layoutId = R.layout.fragment_settings
    override val viewModel by viewModel<SettingsViewModelImpl>()
    override val clickHandler by clickHandler<SettingsClickHandler>()
}

package com.sdoras.petfeeder.settings.views

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentSettingsBinding
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class SettingsFragment : DataBoundFragment<FragmentSettingsBinding>() {

    override val viewModel: SettingsViewModelImpl by viewModel()
    override val layoutId = R.layout.fragment_settings
}

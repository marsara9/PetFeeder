package com.sdoras.petfeeder.settings.views

import android.os.Bundle
import android.view.View
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentSettingsBinding
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class SettingsFragment : DataBoundFragment<FragmentSettingsBinding>() {

    override val viewModel: SettingsViewModelImpl by viewModel()
    override val layoutId = R.layout.fragment_settings

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
    }
}

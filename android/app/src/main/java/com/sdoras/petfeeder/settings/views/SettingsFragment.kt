package com.sdoras.petfeeder.settings.views

import android.os.Bundle
import androidx.lifecycle.ViewModelProvider
import androidx.preference.PreferenceFragmentCompat
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModel
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModelImpl

class SettingsFragment : PreferenceFragmentCompat() {

    private lateinit var viewModel : SettingsViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        viewModel = ViewModelProvider(this).get(SettingsViewModelImpl::class.java)
    }

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        setPreferencesFromResource(R.xml.root_preferences, rootKey)
    }
}
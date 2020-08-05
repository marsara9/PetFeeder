package com.sdoras.petfeeder.setup.viewModels.impl

import android.content.Context
import android.graphics.drawable.Drawable
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel

class SetupViewModelImpl(private val context : Context, settingsRepository: SettingsRepository) : AbstractViewModel(), SetupViewModel {

    private var stepIndex = 0

    init {

    }

    override fun onNext() {

    }
}
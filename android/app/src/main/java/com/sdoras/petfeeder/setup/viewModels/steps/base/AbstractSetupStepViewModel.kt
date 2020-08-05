package com.sdoras.petfeeder.setup.viewModels.steps.base

import android.graphics.drawable.Drawable
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel

abstract class AbstractSetupStepViewModel : AbstractViewModel(), SetupStepViewModel {

    final override val message = MutableLiveData<String>()
    final override val image = MutableLiveData<Drawable>()

}
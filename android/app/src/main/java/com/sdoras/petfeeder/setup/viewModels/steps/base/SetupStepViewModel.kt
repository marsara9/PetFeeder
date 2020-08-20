package com.sdoras.petfeeder.setup.viewModels.steps.base

import android.os.Bundle
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SetupStepViewModel : BaseViewModel {

    var delegate : Delegate?

    interface Delegate {
        fun goToNextStep(bundle: Bundle? = null)
    }
}

package com.sdoras.petfeeder.setup.viewModels.steps.base

import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SetupStepViewModel : BaseViewModel {

    var delegate : Delegate?

    interface Delegate {
        fun goToNextStep()
    }
}

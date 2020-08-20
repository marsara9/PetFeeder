package com.sdoras.petfeeder.setup.viewModels.steps.base

import com.sdoras.petfeeder.core.viewModels.AbstractViewModel

abstract class AbstractSetupStepViewModel : AbstractViewModel(), SetupStepViewModel {

    override var delegate : SetupStepViewModel.Delegate? = null

}

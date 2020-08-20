package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.util.Log
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel

class IntroductionSetupStepViewModelImpl() : AbstractSetupStepViewModel(), IntroductionSetupStepViewModel {

    override fun onNext() {
        if(delegate == null) {
            Log.d("Intro", "delegate not set.")
        }
        delegate?.goToNextStep()
    }
}

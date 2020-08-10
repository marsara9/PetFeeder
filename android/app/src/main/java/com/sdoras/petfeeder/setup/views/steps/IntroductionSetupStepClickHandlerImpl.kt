package com.sdoras.petfeeder.setup.views.steps

import android.view.View
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel

class IntroductionSetupStepClickHandlerImpl(override val viewModel: IntroductionSetupStepViewModel) : IntroductionSetupStepClickHandler {

    override fun onNext(view : View) {
        viewModel.onNext()
    }
}

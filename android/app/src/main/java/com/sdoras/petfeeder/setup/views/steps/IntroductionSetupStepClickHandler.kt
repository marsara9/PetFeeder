package com.sdoras.petfeeder.setup.views.steps

import android.view.View
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel

interface IntroductionSetupStepClickHandler : ClickHandler<IntroductionSetupStepViewModel> {
    fun onNext(view : View)
}

package com.sdoras.petfeeder.setup.views.steps

import android.view.View
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel

interface ScanForFeedersSetupStepClickHandler : ClickHandler<ScanForFeedersSetupStepViewModel> {

    fun onTryAgain(view : View)

    fun onNext(view : View)

}

package com.sdoras.petfeeder.setup.views.steps

import android.view.View
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel

class ScanForFeedersSetupStepClickHandlerImpl(
        override val viewModel: ScanForFeedersSetupStepViewModel
) : ScanForFeedersSetupStepClickHandler {

    override fun onTryAgain(view: View) {
        viewModel.tryAgain()
    }

    override fun onNext(view: View) {

    }
}

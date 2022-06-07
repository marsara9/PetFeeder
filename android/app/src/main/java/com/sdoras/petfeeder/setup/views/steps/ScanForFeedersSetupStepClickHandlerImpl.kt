package com.sdoras.petfeeder.setup.views.steps

import android.view.View
import androidx.fragment.app.FragmentManager
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel

class ScanForFeedersSetupStepClickHandlerImpl(
        override val viewModel: ScanForFeedersSetupStepViewModel,
        override val fragmentManager: FragmentManager

) : ScanForFeedersSetupStepClickHandler {

    override fun onTryAgain(view: View) {
        viewModel.tryAgain(view.context)
    }

    override fun onNext(view: View) {

    }
}

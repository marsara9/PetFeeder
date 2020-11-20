package com.sdoras.petfeeder.setup.views.steps

import android.view.View
import androidx.fragment.app.FragmentManager
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel

class IntroductionSetupStepClickHandlerImpl(
        override val viewModel: IntroductionSetupStepViewModel,
        override val fragmentManager: FragmentManager
) : IntroductionSetupStepClickHandler {

    override fun onNext(view : View) {
        viewModel.onNext()
    }
}

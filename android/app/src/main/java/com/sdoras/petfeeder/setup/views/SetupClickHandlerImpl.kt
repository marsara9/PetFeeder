package com.sdoras.petfeeder.setup.views

import android.view.View
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel

class SetupClickHandlerImpl(override val viewModel : SetupViewModel) : SetupClickHandler {

    override fun onNext(view: View, setupStepViewModel: SetupStepViewModel) {

        setupStepViewModel.onNext()
                .subscribe({
                    viewModel.onNext()
                }, {

                })
    }

    override fun onCancel(view: View) {

    }

    override fun onBack(view: View) {

    }

    override fun onDone(view: View) {

    }
}
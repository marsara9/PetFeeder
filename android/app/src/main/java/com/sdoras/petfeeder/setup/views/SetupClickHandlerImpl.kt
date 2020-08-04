package com.sdoras.petfeeder.setup.views

import android.view.View
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel

class SetupClickHandlerImpl(override val viewModel : SetupViewModel) : SetupClickHandler {

    override fun onNext(view: View) {
        viewModel.onNext()
    }

    override fun onCancel(view: View) {

    }

    override fun onBack(view: View) {

    }

    override fun onDone(view: View) {

    }
}
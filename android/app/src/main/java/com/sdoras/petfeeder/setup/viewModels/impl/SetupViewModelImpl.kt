package com.sdoras.petfeeder.setup.viewModels.impl

import androidx.fragment.app.Fragment
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment
import com.sdoras.petfeeder.setup.views.steps.ConnectToAccessPointSetupStepFragment
import com.sdoras.petfeeder.setup.views.steps.IntroductionSetupStepFragment
import com.sdoras.petfeeder.setup.views.steps.ScanForFeedersSetupStepFragment

class SetupViewModelImpl() : AbstractViewModel(), SetupViewModel {

    override val currentStepFragment = MutableLiveData<Fragment>()

    private val steps = listOf<AbstractSetupStepFragment.Factory<*>>(
            IntroductionSetupStepFragment.Factory(),
            ScanForFeedersSetupStepFragment.Factory(),
            ConnectToAccessPointSetupStepFragment.Factory()
    )
    private var stepIndex = 0

    init {
        currentStepFragment.value = steps[stepIndex++].build()
    }

    override fun onNext() {
        currentStepFragment.value = steps[stepIndex++].build()
    }
}

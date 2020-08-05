package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.content.Context
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel

class IntroductionSetupStepViewModelImpl(context: Context) : AbstractSetupStepViewModel(), IntroductionSetupStepViewModel {

    init {
        message.value = "Lets get your feeder setup..."
        image.value = context.getDrawable(R.drawable.picture2)
    }
}

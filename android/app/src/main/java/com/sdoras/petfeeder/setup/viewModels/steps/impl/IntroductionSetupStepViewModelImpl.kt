package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.content.Context
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import io.reactivex.rxjava3.core.Completable

class IntroductionSetupStepViewModelImpl(context: Context) : AbstractSetupStepViewModel(), IntroductionSetupStepViewModel {

    init {
//        message.value = "Lets get your feeder setup..."
//        image.value = context.getDrawable(R.drawable.picture2)
    }

    override fun onNext() : Completable {
        return Completable.complete()
    }
}

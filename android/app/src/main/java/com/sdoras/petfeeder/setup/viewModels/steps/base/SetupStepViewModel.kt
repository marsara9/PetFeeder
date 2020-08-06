package com.sdoras.petfeeder.setup.viewModels.steps.base

import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import io.reactivex.rxjava3.core.Completable

interface SetupStepViewModel : BaseViewModel {

    fun onNext() : Completable

}

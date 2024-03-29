package com.sdoras.petfeeder.setup.viewModels

import android.os.Bundle
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import com.sdoras.petfeeder.setup.views.AbstractSetupStepFragment

interface SetupViewModel : BaseViewModel {

    val currentStepFragment : LiveData<AbstractSetupStepFragment<*, *>>

    fun onNext(bundle: Bundle?)
}

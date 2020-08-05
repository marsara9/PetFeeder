package com.sdoras.petfeeder.setup.viewModels

import androidx.fragment.app.Fragment
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SetupViewModel : BaseViewModel {

    val currentStepFragment : LiveData<Fragment>

    fun onNext()
}

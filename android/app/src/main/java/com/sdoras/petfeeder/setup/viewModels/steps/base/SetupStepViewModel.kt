package com.sdoras.petfeeder.setup.viewModels.steps.base

import android.graphics.drawable.Drawable
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SetupStepViewModel : BaseViewModel {

    val message : LiveData<String>
    val image : LiveData<Drawable>

}

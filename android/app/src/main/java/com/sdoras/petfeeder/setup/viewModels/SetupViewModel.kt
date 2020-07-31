package com.sdoras.petfeeder.setup.viewModels

import android.graphics.drawable.Drawable
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SetupViewModel : BaseViewModel {
    val image : LiveData<Drawable>
    val status : LiveData<String>
    val message : LiveData<String>
    val isNextVisible : LiveData<Boolean>
    val isCancelVisible : LiveData<Boolean>
    val isNextEnabled : LiveData<Boolean>
    val isCancelEnabled : LiveData<Boolean>
}

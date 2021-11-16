package com.sdoras.petfeeder.core.views

import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface DialogClickHandler<T : BaseViewModel>  : ClickHandler<T> {

    fun onPositiveButtonClicked()
    fun onNegativeButtonClicked()
    fun onNeutralButtonClicked()

}

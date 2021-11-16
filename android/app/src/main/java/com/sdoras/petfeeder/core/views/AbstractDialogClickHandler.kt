package com.sdoras.petfeeder.core.views

import android.app.Dialog
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

abstract class AbstractDialogClickHandler<T : BaseViewModel>(
        private val dialog: Dialog
) : DialogClickHandler<T> {

    override fun onPositiveButtonClicked() {
        dialog.dismiss()
    }

    override fun onNegativeButtonClicked() {
        dialog.dismiss()
    }

    override fun onNeutralButtonClicked() {
        dialog.dismiss()
    }
}

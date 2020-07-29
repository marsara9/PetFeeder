package com.sdoras.petfeeder.core.views.dialogs

import android.app.AlertDialog
import android.content.Context
import com.sdoras.petfeeder.R

class ProgressDialog(context : Context) {

    private val dialogBuilder : AlertDialog.Builder = AlertDialog.Builder(context)
            .setView(R.layout.dialog_progress)
            .setCancelable(false)

    private var dialog : AlertDialog? = null

    fun show() {
        dialog = dialogBuilder.show()
    }

    fun dismiss() {
        dialog?.dismiss()
    }
}

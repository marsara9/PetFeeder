package com.sdoras.petfeeder.core.views

import android.app.AlertDialog
import android.content.Context
import android.widget.EditText
import com.sdoras.petfeeder.R

class EditTextDialog(context : Context, titleId : Int) {

    private var dialogBuilder : AlertDialog.Builder
    private var dialog : AlertDialog? = null

    init {
        dialogBuilder = AlertDialog.Builder(context)
                .setView(R.layout.dialog_input_text)
                .setTitle(titleId)
    }

    fun setPositiveButton(textId : Int, callback : (String) -> Unit) {
        dialogBuilder = dialogBuilder.setPositiveButton(textId) { _, _ ->
            dialog?.findViewById<EditText>(android.R.id.edit)
                    ?.text
                    ?.toString()
                    ?.let(callback)
        }
    }

    fun setNegativeButton(textId : Int, callback : (() -> Unit)? = null) {
        dialogBuilder = dialogBuilder.setNegativeButton(textId) { dialog, _ ->
            callback?.invoke()
            dialog.cancel()
        }
    }

    fun show() {
        dialog = dialogBuilder.show()
    }
}

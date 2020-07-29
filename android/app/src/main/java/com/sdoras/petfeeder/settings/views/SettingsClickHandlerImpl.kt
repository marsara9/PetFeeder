package com.sdoras.petfeeder.settings.views

import android.app.AlertDialog
import android.view.View
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.dialogs.EditTextDialog
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModel

class SettingsClickHandlerImpl(override val viewModel: SettingsViewModel) : SettingsClickHandler {

    override fun onEditSSID(view: View) {
        EditTextDialog(view.context, R.string.setting_edit_ssid).apply {
            setPositiveButton(R.string.ok) {
                viewModel.setWifi(it, null)
            }
            setNegativeButton(R.string.cancel)
            show()
        }
    }

    override fun onEditPassword(view: View) {
        EditTextDialog(view.context, R.string.setting_edit_password).apply {
            setPositiveButton(R.string.ok) {
                viewModel.setWifi(viewModel.ssid.value ?: "", it)
            }
            setNegativeButton(R.string.cancel)
            show()
        }
    }

    override fun onEditName(view: View) {
        EditTextDialog(view.context, R.string.setting_edit_name).apply {
            setPositiveButton(R.string.ok) {
                viewModel.setName(it)
            }
            setNegativeButton(R.string.cancel)
            show()
        }
    }

    override fun onResetToFactorySettings(view: View) {
        AlertDialog.Builder(view.context)
                .setTitle("Are you sure?")
                .setMessage("This will erase all settings and you must go though the setup wizard again to restore connectivity.")
                .setCancelable(true)
                .setPositiveButton("Yes") { _, _ ->
                    viewModel.restoreFactoryDefaults()
                }.setNegativeButton("No", null)
                .show()
    }
}

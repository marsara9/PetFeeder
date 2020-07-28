package com.sdoras.petfeeder.settings.views

import android.view.View
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.dialogs.EditTextDialog
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModel

class SettingsClickHandlerImpl(override val viewModel: SettingsViewModel) : SettingsClickHandler {

    override fun onEditSSID(view: View) {
        EditTextDialog(view.context, R.string.setting_edit_ssid).apply {
            setPositiveButton(R.string.ok) {
                viewModel.setWifi(it, null)
                viewModel.refresh()
            }
            setNegativeButton(R.string.cancel)
            show()
        }
    }

    override fun onEditPassword(view: View) {
        EditTextDialog(view.context, R.string.setting_edit_password).apply {
            setPositiveButton(R.string.ok) {
                viewModel.apply {
                    setWifi(ssid.value ?: "", it)
                }
            }
            setNegativeButton(R.string.cancel)
            show()
        }
    }

    override fun onEditName(view: View) {
        EditTextDialog(view.context, R.string.setting_edit_name).apply {
            setPositiveButton(R.string.ok) {
                viewModel.setName(it)
                viewModel.refresh()
            }
            setNegativeButton(R.string.cancel)
            show()
        }
    }
}

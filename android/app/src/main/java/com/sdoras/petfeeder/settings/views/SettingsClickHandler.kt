package com.sdoras.petfeeder.settings.views

import android.view.View
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.settings.viewModels.SettingsViewModel

interface SettingsClickHandler : ClickHandler<SettingsViewModel> {
    fun onEditSSID(view : View)
    fun onEditPassword(view : View)
    fun onEditName(view : View)
}

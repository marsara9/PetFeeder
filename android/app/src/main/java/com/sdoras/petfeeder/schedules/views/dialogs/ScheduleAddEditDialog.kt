package com.sdoras.petfeeder.schedules.views.dialogs

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.core.views.DataBoundDialogFragment
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.DialogScheduleAddEditBinding
import com.sdoras.petfeeder.schedules.viewModels.ScheduleAddEditViewModel
import com.sdoras.petfeeder.schedules.viewModels.ScheduleAddEditViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class ScheduleAddEditDialog : DataBoundDialogFragment<ScheduleAddEditViewModel, DialogScheduleAddEditBinding>() {
    override val layoutId = R.layout.dialog_schedule_add_edit
    override val viewModel by viewModel<ScheduleAddEditViewModelImpl>()
    override val clickHandler: ClickHandler<ScheduleAddEditViewModel>? = null
}

package com.sdoras.petfeeder.schedules.views

import android.view.View
import androidx.fragment.app.FragmentManager
import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModel
import com.sdoras.petfeeder.schedules.views.dialogs.ScheduleAddEditDialog

class SchedulesClickHandlerImpl(
        override val viewModel: SchedulesViewModel,
        override val fragmentManager: FragmentManager
) : SchedulesClickHandler {

    override fun onEditScheduledFeeding(view: View, scheduledFeeding: ScheduledFeeding) {
        ScheduleAddEditDialog().apply {
            this.scheduledFeeding = scheduledFeeding
            positiveButtonClickListener = View.OnClickListener {
                this.scheduledFeeding?.let {
                    this@SchedulesClickHandlerImpl.viewModel.updateScheduledFeeding(it)
                    dismiss()
                }
            }
        }.show(fragmentManager, null)
    }

    override fun onAddNewScheduledFeeding(view: View) {
        ScheduleAddEditDialog().apply {
            positiveButtonClickListener = View.OnClickListener {
                scheduledFeeding?.let {
                    this@SchedulesClickHandlerImpl.viewModel.createScheduledFeeding(it)
                    dismiss()
                }
            }
        }.show(fragmentManager, null)
    }
}

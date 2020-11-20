package com.sdoras.petfeeder.schedules.views

import android.view.View
import android.widget.Toast
import androidx.fragment.app.FragmentManager
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModel
import com.sdoras.petfeeder.schedules.views.dialogs.ScheduleAddEditDialog

class SchedulesClickHandlerImpl(
        override val viewModel: SchedulesViewModel,
        override val fragmentManager: FragmentManager
) : SchedulesClickHandler {

    override fun onEditScheduledFeeding(view: View, scheduledItem: SchedulesViewModel.ScheduledItem) {
        Toast.makeText(view.context, "Edit", Toast.LENGTH_SHORT).show()
    }

    override fun onAddNewScheduledFeeding(view: View) {
        ScheduleAddEditDialog().show(fragmentManager, null)
    }
}

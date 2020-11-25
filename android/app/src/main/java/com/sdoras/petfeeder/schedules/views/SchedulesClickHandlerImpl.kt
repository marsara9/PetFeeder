package com.sdoras.petfeeder.schedules.views

import android.view.View
import android.widget.Toast
import androidx.fragment.app.FragmentManager
import com.google.android.material.datepicker.MaterialDatePicker
import com.google.android.material.dialog.MaterialDialogs
import com.google.android.material.timepicker.MaterialTimePicker
import com.google.android.material.timepicker.TimeFormat
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModel
import com.sdoras.petfeeder.schedules.views.dialogs.ScheduleAddEditDialog

class SchedulesClickHandlerImpl(
        override val viewModel: SchedulesViewModel,
        override val fragmentManager: FragmentManager
) : SchedulesClickHandler {

    override fun onEditScheduledFeeding(view: View, scheduledItem: SchedulesViewModel.ScheduledItem) {
        Toast.makeText(view.context, "Edit", Toast.LENGTH_SHORT).show()

        MaterialTimePicker.Builder()
                .apply {
                    setTimeFormat(if(android.text.format.DateFormat.is24HourFormat(view.context)) {
                        TimeFormat.CLOCK_24H
                    } else {
                        TimeFormat.CLOCK_12H
                    })
                    setHour(scheduledItem.hour)
                    setMinute(scheduledItem.minute)
                }
                .build()
                .show(fragmentManager, null)
    }

    override fun onAddNewScheduledFeeding(view: View) {
        ScheduleAddEditDialog().show(fragmentManager, null)
    }
}

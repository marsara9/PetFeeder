package com.sdoras.petfeeder.schedules.viewModels

import android.graphics.drawable.Drawable
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SchedulesViewModel : BaseViewModel {
    val numberOfFeedingsPerDay: LiveData<Int>
    val numberOfCupsPerDay: LiveData<Double>
    val schedules: LiveData<List<ScheduledItem>>

    fun createScheduledFeeding(scheduledFeeding: ScheduledFeeding)
    fun updateScheduledFeeding(scheduledFeeding: ScheduledFeeding)

    data class ScheduledItem(
            val timeString: String,
            val icon : Drawable,
            val scheduledFeeding: ScheduledFeeding
    )
}

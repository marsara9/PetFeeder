package com.sdoras.petfeeder.schedules.viewModels

import android.graphics.drawable.Drawable
import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface SchedulesViewModel : BaseViewModel {
    val numberOfFeedingsPerDay: LiveData<Int>
    val numberOfCupsPerDay: LiveData<Double>
    val schedules: LiveData<List<ScheduledItem>>

    data class ScheduledItem(
            val timeString: String,
            val icon : Drawable,
            val cups: Double,
            val hour : Int,
            val minute : Int
    )
}

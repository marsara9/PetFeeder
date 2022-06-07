package com.sdoras.petfeeder.schedules.viewModels

import android.content.Context
import android.text.format.DateFormat
import androidx.core.content.ContextCompat
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.asLiveData
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.services.repositories.ScheduleRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch
import java.util.*

class SchedulesViewModelImpl(
        context: Context,
        private val schedulesRepository: ScheduleRepository
) : AbstractViewModel(), SchedulesViewModel {

    override val numberOfFeedingsPerDay = schedulesRepository.get()
            .map { it.size }
            .asLiveData()

    override val numberOfCupsPerDay = schedulesRepository.get()
            .map {
                it.fold(0.0) { current, feeding ->
                    current + feeding.cups
                }
            }.asLiveData()

    override val schedules = schedulesRepository.get()
            .map { scheduledFeedings ->
                scheduledFeedings.map { scheduledFeeding ->
                    val timeString = DateFormat.getTimeFormat(context)
                            .format(Calendar.getInstance(TimeZone.getDefault()).apply {
                                set(Calendar.HOUR_OF_DAY, scheduledFeeding.hour.toInt())
                                set(Calendar.MINUTE, scheduledFeeding.minute.toInt())
                            }.time)

                    val drawable = ContextCompat.getDrawable(context, when(scheduledFeeding.hour) {
                        in 0..5 -> R.drawable.ic_night
                        in 6..10 -> R.drawable.ic_morning
                        in 11..16 -> R.drawable.ic_midday
                        in 17..23 -> R.drawable.ic_night
                        else -> 0
                    })!!

                    SchedulesViewModel.ScheduledItem(timeString, drawable, scheduledFeeding)
                }
            }.asLiveData()

    override fun createScheduledFeeding(scheduledFeeding: ScheduledFeeding) {
        viewModelScope.launch {
            schedulesRepository.addScheduledFeeding(
                    scheduledFeeding.cups,
                    scheduledFeeding.hour,
                    scheduledFeeding.minute
            )
            schedulesRepository.init()
        }
    }

    override fun updateScheduledFeeding(scheduledFeeding: ScheduledFeeding) {
        viewModelScope.launch {
            schedulesRepository.addScheduledFeeding(
                    scheduledFeeding.cups,
                    scheduledFeeding.hour,
                    scheduledFeeding.minute
            )
            schedulesRepository.init()
        }
    }
}

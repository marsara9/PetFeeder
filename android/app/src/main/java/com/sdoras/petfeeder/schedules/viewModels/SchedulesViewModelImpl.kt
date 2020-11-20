package com.sdoras.petfeeder.schedules.viewModels

import android.content.Context
import android.text.format.DateFormat
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.services.repositories.ScheduleRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import java.util.*

class SchedulesViewModelImpl(
        context: Context,
        schedulesRepository: ScheduleRepository
) : AbstractViewModel(), SchedulesViewModel {

    override val numberOfFeedingsPerDay = MutableLiveData<Int>()
    override val numberOfCupsPerDay = MutableLiveData<Double>()
    override val schedules = MutableLiveData<List<SchedulesViewModel.ScheduledItem>>()

    init {
        disposables.add(schedulesRepository.get()
                .compose(applyDefaultObservableRxSettings())
                .map {
                    it.plus(ScheduledFeeding(UUID.randomUUID(), 1.25f, 8, 30))
                            .plus(ScheduledFeeding(UUID.randomUUID(), 1.25f, 13, 30))
                            .plus(ScheduledFeeding(UUID.randomUUID(), 1.25f, 18, 30))
                            .fold(mutableListOf<SchedulesViewModel.ScheduledItem>()) { list, item ->

                        val timeString = DateFormat.getTimeFormat(context)
                                .format(Calendar.getInstance(TimeZone.getDefault()).apply {
                                    set(Calendar.HOUR_OF_DAY, item.hour.toInt())
                                    set(Calendar.MINUTE, item.minute.toInt())
                                }.time)

                        list.add(SchedulesViewModel.ScheduledItem(timeString, item.cups.toDouble(), context.getDrawable(when(item.hour) {
                            in 0..5 -> R.drawable.ic_night
                            in 6..10 -> R.drawable.ic_morning
                            in 11..16 -> R.drawable.ic_midday
                            in 17..23 -> R.drawable.ic_night
                            else -> 0
                        })!!))
                        list
                    }
                }.subscribe(schedules::setValue) {

                })

        disposables.add(schedulesRepository.get()
                .compose(applyDefaultObservableRxSettings())
                .map { it.size }
                .subscribe(numberOfFeedingsPerDay::setValue) {

                })

        disposables.add(schedulesRepository.get()
                .compose(applyDefaultObservableRxSettings())
                .map {
                    it.fold(0.0) { current, feeding ->
                        current + feeding.cups
                    }
                }.subscribe(numberOfCupsPerDay::setValue) {

                })
    }
}

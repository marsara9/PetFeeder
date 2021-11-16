package com.sdoras.petfeeder.schedules.viewModels

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.utils.LiveDataUtils
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import java.util.*

class ScheduleAddEditViewModelImpl(

) : AbstractViewModel(), ScheduleAddEditViewModel {

    override val cups = MutableLiveData<Double>()
    override val hour = MutableLiveData<Int>()
    override val minute = MutableLiveData<Int>()

    override var scheduledFeeding: ScheduledFeeding? = null

    init {
        LiveDataUtils.combineLatest(cups, hour, minute) { cups, hour, minute ->
            ScheduledFeeding(
                    scheduledFeeding?.id ?: UUID.randomUUID(),
                    cups.toFloat(),
                    hour.toByte(),
                    minute.toByte())
        }.observeForever {
            this.scheduledFeeding = it
        }
    }
}

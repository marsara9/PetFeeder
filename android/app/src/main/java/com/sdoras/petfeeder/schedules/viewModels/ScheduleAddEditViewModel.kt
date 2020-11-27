package com.sdoras.petfeeder.schedules.viewModels

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface ScheduleAddEditViewModel : BaseViewModel {

    val cups : MutableLiveData<Double>
    val hour : MutableLiveData<Int>
    val minute : MutableLiveData<Int>

    val scheduledFeeding : ScheduledFeeding?
}

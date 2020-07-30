package com.sdoras.petfeeder.schedules.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.services.repositories.ScheduleRepository

class SchedulesViewModelImpl(
        schedulesRepository: ScheduleRepository
) : ViewModel(), SchedulesViewModel {

    override val showLoading = MutableLiveData<Int>()

    init {
        schedulesRepository.get()
                .subscribe()
    }
}

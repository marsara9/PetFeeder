package com.sdoras.petfeeder.schedules.viewModels

import com.sdoras.petfeeder.core.services.repositories.ScheduleRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel

class SchedulesViewModelImpl(
        schedulesRepository: ScheduleRepository
) : AbstractViewModel(), SchedulesViewModel {

    init {
        disposables.add(schedulesRepository.get()
                .subscribe())
    }
}

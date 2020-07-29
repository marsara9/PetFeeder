package com.sdoras.petfeeder.schedules.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.schedules.services.ScheduleServices
import io.reactivex.rxjava3.core.Completable

class SchedulesViewModelImpl(private val schedulesServices: ScheduleServices) : ViewModel(), SchedulesViewModel {

    override val showLoading = MutableLiveData<Int>()

    init {
        refresh()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()
    }

    private fun refresh() : Completable {
        return schedulesServices.getAllScheduledFeedings()
                .doOnSuccess {

                }.ignoreElement()
    }
}

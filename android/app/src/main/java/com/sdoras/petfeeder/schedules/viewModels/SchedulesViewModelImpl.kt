package com.sdoras.petfeeder.schedules.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.schedules.services.ScheduleServices
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.schedulers.Schedulers

class SchedulesViewModelImpl(private val schedulesServices: ScheduleServices) : ViewModel(), SchedulesViewModel {

    override val showLoading = MutableLiveData<Boolean>()

    init {
        refresh()
    }

    override fun refresh() {
        schedulesServices.getAllScheduledFeedings()
                .doOnSubscribe { showLoading.postValue(true) }
                .doAfterTerminate { showLoading.postValue(false) }
                .observeOn(Schedulers.io())
                .subscribeOn(AndroidSchedulers.mainThread())
                .subscribe({

                }, {

                })
    }

}

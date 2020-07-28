package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.history.services.FeedingServices
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.schedulers.Schedulers

class HistoryViewModelImpl(private val feedingServices: FeedingServices) : ViewModel(), HistoryViewModel {

    override val showLoading = MutableLiveData<Boolean>()

    init {
        refresh()
    }

    override fun refresh() {
        feedingServices.getFeedingHistory()
                .doOnSubscribe { showLoading.postValue(true) }
                .doAfterTerminate { showLoading.postValue(false) }
                .observeOn(Schedulers.io())
                .subscribeOn(AndroidSchedulers.mainThread())
                .subscribe({

                }, {

                })
    }

}

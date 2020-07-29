package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.history.services.FeedingServices
import io.reactivex.rxjava3.core.Completable

class HistoryViewModelImpl(private val feedingServices: FeedingServices) : ViewModel(), HistoryViewModel {

    override val showLoading = MutableLiveData<Boolean>()

    init {
        refresh()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()
    }

    private fun refresh() : Completable {
        return feedingServices.getFeedingHistory()
                .doOnSuccess {

                }.ignoreElement()
    }
}

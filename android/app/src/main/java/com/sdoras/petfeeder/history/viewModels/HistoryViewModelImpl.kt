package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository

class HistoryViewModelImpl(
        feedingRepository: FeedingRepository
) : ViewModel(), HistoryViewModel {

    override val showLoading = MutableLiveData<Int>()

    init {
        feedingRepository.get()
                .subscribe()
    }
}

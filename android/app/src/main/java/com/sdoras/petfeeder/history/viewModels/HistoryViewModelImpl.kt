package com.sdoras.petfeeder.history.viewModels

import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel

class HistoryViewModelImpl(
        feedingRepository: FeedingRepository
) : AbstractViewModel(), HistoryViewModel {

    init {
        disposables.add(feedingRepository.get()
                .subscribe())
    }
}

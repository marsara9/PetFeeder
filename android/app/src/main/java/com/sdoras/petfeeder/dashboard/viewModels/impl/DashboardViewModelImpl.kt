package com.sdoras.petfeeder.dashboard.viewModels.impl

import android.text.format.DateUtils
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.dashboard.viewModels.DashboardViewModel

class DashboardViewModelImpl(
        feederFinderRepository: FeederFinderRepository,
        private val feederUrlRepository: FeederUrlRepository,
        feedingsRepository: FeedingRepository
) : AbstractViewModel(), DashboardViewModel {

    override val feeders = MutableLiveData<Set<String>>()
    override val isLoading = MutableLiveData<Boolean>()
    override val numberOfFeedingsToday = MutableLiveData<Int>()
    override val totalCupsDispensedToday = MutableLiveData<Double>()

    override var feederUrl: String?
        get() = feederUrlRepository.getCurrent()
        set(value) {
            value?.let(feederUrlRepository::setFeederUrl)
        }

    init {

        disposables.add(feederFinderRepository.get()
                .compose(applyDefaultObservableRxSettings())
                .subscribe({
                    feeders.value = it
                }, {

                }))

        disposables.add(feedingsRepository.get()
                .map {
                    it.filter { feeding ->
                        DateUtils.isToday(feeding.date.time)
                    }
                }.subscribe({
                    numberOfFeedingsToday.value = it.size
                    totalCupsDispensedToday.value = it.sumByDouble(Feeding::cups)
                }, {

                }))
    }
}

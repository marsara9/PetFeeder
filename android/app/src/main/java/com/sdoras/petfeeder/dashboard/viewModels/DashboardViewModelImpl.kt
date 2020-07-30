package com.sdoras.petfeeder.dashboard.viewModels

import android.text.format.DateUtils
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository

class DashboardViewModelImpl(
        feederFinderRepository: FeederFinderRepository,
        private val feederUrlRepository: FeederUrlRepository,
        feedingsRepository: FeedingRepository
) : ViewModel(), DashboardViewModel {

    override val showLoading = MutableLiveData<Int>()
    override val feeders = MutableLiveData<Set<String>>()
    override val numberOfFeedingsToday = MutableLiveData<Int>()
    override val totalCupsDispensedToday = MutableLiveData<Double>()

    override var feederUrl: String?
        get() = feederUrlRepository.getCurrent()
        set(value) {
            value?.let(feederUrlRepository::setFeederUrl)
        }

    init {

        feederFinderRepository.get()
                .compose(applyDefaultObservableRxSettings())
                .subscribe({
                    feeders.value = it
                }, {

                })

        feedingsRepository.get()
                .map {
                    it.filter { feeding ->
                        DateUtils.isToday(feeding.date.time)
                    }
                }.subscribe({
                    numberOfFeedingsToday.value = it.size
                    totalCupsDispensedToday.value = it.sumByDouble(Feeding::cups)
                }, {

                })
    }
}

package com.sdoras.petfeeder.dashboard.viewModels

import android.text.format.DateUtils
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository

class DashboardViewModelImpl(
        feedingsRepository: FeedingRepository
) : ViewModel(), DashboardViewModel {

    override val showLoading = MutableLiveData<Int>()
    override val numberOfFeedingsToday = MutableLiveData<Int>()
    override val totalCupsDispensedToday = MutableLiveData<Double>()

    init {
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

package com.sdoras.petfeeder.dashboard.viewModels

import android.text.format.DateUtils
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.history.models.Feeding
import com.sdoras.petfeeder.history.services.FeedingServices
import io.reactivex.rxjava3.core.Completable

class DashboardPageViewModelImpl(private val feedingServices: FeedingServices) : ViewModel(), DashboardPageViewModel {
    override val showLoading = MutableLiveData<Boolean>()
    override val numberOfFeedingsToday = MutableLiveData<Int>()
    override val totalCupsDispensedToday = MutableLiveData<Double>()

    init {
        refresh()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()
    }

    private fun refresh() : Completable {
        return feedingServices.getFeedingHistory()
                .map {
                    it.filter { feeding ->
                        DateUtils.isToday(feeding.date.time)
                    }
                }.doOnSuccess {
                    numberOfFeedingsToday.postValue(it.size)
                    totalCupsDispensedToday.postValue(it.sumByDouble(Feeding::cups))
                }.ignoreElement()
    }
}

package com.sdoras.petfeeder.dashboard.viewModels

import android.text.format.DateUtils
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.models.Registration
import com.sdoras.petfeeder.core.services.FeedingServices
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.RegistrationServices
import com.sdoras.petfeeder.core.services.SettingsServices
import io.reactivex.rxjava3.core.Completable

class DashboardPageViewModelImpl(private val feedingServices: FeedingServices,
                                 private val settingsServices: SettingsServices,
                                 registrationServices : RegistrationServices,
                                 notificationServices: NotificationServices
) : ViewModel(), DashboardPageViewModel {
    override val showLoading = MutableLiveData<Int>()
    override val numberOfFeedingsToday = MutableLiveData<Int>()
    override val totalCupsDispensedToday = MutableLiveData<Double>()
    override val name = MutableLiveData<String>()

    init {
        refreshFeedingHistory()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()

        refreshName()
                .compose(applyDefaultCompletableRxSettings())
                .subscribe()

        if(notificationServices.isNotificationTokenUpdated()) {
            notificationServices.getCloudMessagingToken()
                    .compose(applyDefaultSingleRxSettings())
                    .map { Registration(notificationServices.getDeviceId(), it,"Android") }
                    .flatMapCompletable { registrationServices.registerDevice(it) }
                    .subscribe({
                        notificationServices.setTokenUpdated(false)
                    }, {
                    })
        }
    }

    private fun refreshName() : Completable {
        return settingsServices.getSettings()
                .doOnSuccess {
                    name.postValue(it.name)
                }.ignoreElement()
    }

    private fun refreshFeedingHistory() : Completable {
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

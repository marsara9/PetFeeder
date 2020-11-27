package com.sdoras.petfeeder.dashboard.viewModels.impl

import android.text.format.DateUtils
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.models.Registration
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.RegistrationServices
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.dashboard.viewModels.DashboardPageViewModel

class DashboardPageViewModelImpl(
        feederFinderRepository: FeederFinderRepository,
        settingsRepository : SettingsRepository,
        feedingsRepository: FeedingRepository,
        registrationServices : RegistrationServices,
        notificationServices: NotificationServices
) : AbstractViewModel(), DashboardPageViewModel {

    override val name = MutableLiveData<String>()
    override val numberOfFeedingsToday = MutableLiveData<Int>()
    override val totalCupsDispensedToday = MutableLiveData<Double>()

    init {

        disposables.add(feederFinderRepository.get()
                .subscribe())

        disposables.add(settingsRepository.get()
                .subscribe({
                    name.value = it.name
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

        if(notificationServices.isNotificationTokenUpdated()) {
            disposables.add(notificationServices.getCloudMessagingToken()
                    .compose(applyDefaultSingleRxSettings())
                    .map { Registration(notificationServices.getDeviceId(), it,"Android") }
                    .flatMapCompletable { registrationServices.registerDevice(it) }
                    .subscribe({
                        notificationServices.setTokenUpdated(false)
                    }, {

                    }))
        }
    }
}

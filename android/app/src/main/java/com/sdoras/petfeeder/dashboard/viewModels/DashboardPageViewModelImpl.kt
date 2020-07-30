package com.sdoras.petfeeder.dashboard.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.core.models.Registration
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.RegistrationServices
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository

class DashboardPageViewModelImpl(
        feederFinderRepository: FeederFinderRepository,
        feederUrlRepository: FeederUrlRepository,
        settingsRepository : SettingsRepository,
        registrationServices : RegistrationServices,
        notificationServices: NotificationServices
) : ViewModel(), DashboardPageViewModel {

    override val showLoading = MutableLiveData<Int>()
    override val name = MutableLiveData<String>()

    init {

        feederFinderRepository.get()
                .subscribe()

        settingsRepository.get()
                .subscribe({
                    name.value = it.name
                }, {

                })

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
}

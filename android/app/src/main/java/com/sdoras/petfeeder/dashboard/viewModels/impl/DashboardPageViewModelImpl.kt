package com.sdoras.petfeeder.dashboard.viewModels.impl

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.Registration
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.RegistrationServices
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.dashboard.viewModels.DashboardPageViewModel

class DashboardPageViewModelImpl(
        feederFinderRepository: FeederFinderRepository,
        feederUrlRepository: FeederUrlRepository,
        settingsRepository : SettingsRepository,
        registrationServices : RegistrationServices,
        notificationServices: NotificationServices
) : AbstractViewModel(), DashboardPageViewModel {

    override val name = MutableLiveData<String>()

    init {

        disposables.add(feederFinderRepository.get()
                .subscribe())

        disposables.add(settingsRepository.get()
                .subscribe({
                    name.value = it.name
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

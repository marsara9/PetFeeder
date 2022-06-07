package com.sdoras.petfeeder.dashboard.viewModels.impl

import android.text.format.DateUtils
import androidx.lifecycle.asLiveData
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.models.Registration
import com.sdoras.petfeeder.core.services.NotificationServices
import com.sdoras.petfeeder.core.services.RegistrationServices
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.services.retrofit.ServiceCall
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.dashboard.viewModels.DashboardPageViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch

class DashboardPageViewModelImpl(
        settingsRepository: SettingsRepository,
        feedingsRepository: FeedingRepository,
        feederUrlRepository: FeederUrlRepository,
        notificationServices: NotificationServices
) : AbstractViewModel(), DashboardPageViewModel {

    override val name = settingsRepository.get()
            .map { it?.name ?: "" }
            .asLiveData()

    override val numberOfFeedingsToday = feedingsRepository.get()
            .map {
                it.filter { feeding ->
                    DateUtils.isToday(feeding.date.time)
                }
            }.map { it.size }
            .asLiveData()

    override val totalCupsDispensedToday = feedingsRepository.get()
            .map {
                it.filter { feeding ->
                    DateUtils.isToday(feeding.date.time)
                }
            }.map { it.sumOf(Feeding::cups) }
            .asLiveData()

    init {
        if (notificationServices.isNotificationTokenUpdated()) {
            viewModelScope.launch {
                feederUrlRepository.get()
                        .map { url ->
                            url?.let { ServiceCall(it) }
                        }.map {
                            it?.create(RegistrationServices::class.java)
                        }.collect {
                            it?.registerDevice(Registration(
                                    notificationServices.getDeviceId(),
                                    notificationServices.getCloudMessagingToken(),
                                    "Android"
                            ))
                            notificationServices.setTokenUpdated(false)
                        }
            }
        }
    }
}

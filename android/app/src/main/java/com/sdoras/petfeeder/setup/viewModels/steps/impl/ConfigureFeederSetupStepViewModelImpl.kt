package com.sdoras.petfeeder.setup.viewModels.steps.impl

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.setup.viewModels.steps.ConfigureFeederSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import io.reactivex.rxjava3.core.Completable

class ConfigureFeederSetupStepViewModelImpl(private val settingsRepository: SettingsRepository) : AbstractSetupStepViewModel(), ConfigureFeederSetupStepViewModel {

    override val ssid = MutableLiveData<String>()
    override val password = MutableLiveData<String>()
    override val name = MutableLiveData<String>()

    init {

    }

    override fun onNext() {

        val ssid = ssid.value
        val password = password.value
        val name = name.value

        requireNotNull(ssid)

        disposables.add(settingsRepository.setWiFiSettings(ssid, password)
                ?.compose(applyCompletableShowLoading())
                ?.andThen {
                    name?.let {
                        settingsRepository.setFeederName(it)
                    } ?: Completable.complete()
                }?.subscribe())
    }
}

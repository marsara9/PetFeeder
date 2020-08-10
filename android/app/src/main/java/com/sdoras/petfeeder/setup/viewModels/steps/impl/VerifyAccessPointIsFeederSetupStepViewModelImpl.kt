package com.sdoras.petfeeder.setup.viewModels.steps.impl

import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.setup.viewModels.steps.VerifyAccessPointIsFeederSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel

class VerifyAccessPointIsFeederSetupStepViewModelImpl(feederUrlRepository: FeederUrlRepository, settingsRepository: SettingsRepository) : AbstractSetupStepViewModel(), VerifyAccessPointIsFeederSetupStepViewModel {

    init {
        feederUrlRepository.setFeederUrl("http://192.168.4.1")

        settingsRepository.get()
                .subscribe({

                }, {

                })
    }
}

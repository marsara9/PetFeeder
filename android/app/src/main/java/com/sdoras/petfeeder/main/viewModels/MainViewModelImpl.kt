package com.sdoras.petfeeder.main.viewModels

import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel

class MainViewModelImpl(private val feederFinderRepository: FeederFinderRepository) : AbstractViewModel(), MainViewModel {

    override fun pauseFeederDiscovery() {
        feederFinderRepository.pause()
    }

    override fun resumeFeederDiscovery() {
        feederFinderRepository.resume()
    }

}

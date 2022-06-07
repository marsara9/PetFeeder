package com.sdoras.petfeeder.main.viewModels

import androidx.lifecycle.asLiveData
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.main.viewModels.MainViewModel.Feeder
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext

class MainViewModelImpl(
        private val feederFinderRepository: FeederFinderRepository,
        private val feederUrlRepository: FeederUrlRepository,
        private val settingsRepository: SettingsRepository
) : AbstractViewModel(), MainViewModel {

    override val feeders = feederFinderRepository.get()
            .map { urls ->
                getFeeders(urls)
            }.map {
                it.sortedWith { o1, o2 ->
                    o1.name.compareTo(o2.name)
                }.toList()
            }.asLiveData()

    override var feederUrl: String?
        get() = feederUrlRepository.getCurrent()
        set(value) {
            feederUrlRepository.set(value)
        }

    private suspend fun getFeeders(
            urls: Set<String>
    ): List<Feeder> {
        return withContext(Dispatchers.IO) {
            urls.map { url ->
                async { Feeder(settingsRepository.get(url).name, url) }
            }
        }.awaitAll()
    }

    override fun pauseFeederDiscovery() {
        feederFinderRepository.pause()
    }

    override fun resumeFeederDiscovery() {
        feederFinderRepository.resume()
    }
}

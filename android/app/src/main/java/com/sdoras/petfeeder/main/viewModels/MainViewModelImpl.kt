package com.sdoras.petfeeder.main.viewModels

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.main.viewModels.MainViewModel.Feeder
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.core.Single

class MainViewModelImpl(
        private val feederFinderRepository: FeederFinderRepository,
        private val feederUrlRepository: FeederUrlRepository,
        private val settingsRepository: SettingsRepository
) : AbstractViewModel(), MainViewModel {

    override val feeders = MutableLiveData<List<Feeder>>()

    override var feederUrl: String?
        get() = feederUrlRepository.getCurrent()
        set(value) {
            value?.let(feederUrlRepository::setFeederUrl)
        }

    init {
        disposables.add(feederFinderRepository.get()
                .flatMapSingle {
                    Observable.fromIterable(it)
                            .flatMapSingle { feederUrl ->
                                Single.zip(settingsRepository.get(feederUrl).map { settings ->
                                    settings.name
                                }, Single.just(feederUrl), ::Feeder)
                            }.sorted { o1, o2 ->
                                o1.name.compareTo(o2.name)
                            }.toList()
                }
                .compose(applyDefaultObservableRxSettings())
                .subscribe(feeders::setValue) {

                })
    }

    override fun pauseFeederDiscovery() {
        feederFinderRepository.pause()
    }

    override fun resumeFeederDiscovery() {
        feederFinderRepository.resume()
    }

}

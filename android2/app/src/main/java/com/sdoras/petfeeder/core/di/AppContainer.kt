package com.sdoras.petfeeder.core.di

import com.sdoras.petfeeder.BuildConfig
import com.sdoras.petfeeder.core.coroutines.DefaultDispatcherProvider
import com.sdoras.petfeeder.core.coroutines.DispatcherProvider
import com.sdoras.petfeeder.core.feeder.FeederRepository
import com.sdoras.petfeeder.core.feeder.InMemoryFeederRepository
import com.sdoras.petfeeder.core.feeder.ObserveFeederSwitcherStateUseCase
import com.sdoras.petfeeder.core.feeder.SelectFeederUseCase
import com.sdoras.petfeeder.core.network.FeederApiClientFactory
import com.sdoras.petfeeder.dashboard.FeedingApi

/**
 * Manual dependency graph for the whole app. Deliberately simple (no Hilt/Koin) since the app is
 * small; feature code should only ever depend on the interfaces/use cases exposed here so a future
 * swap to a DI framework doesn't ripple through feature packages.
 */
class AppContainer {
    val dispatcherProvider: DispatcherProvider = DefaultDispatcherProvider()

    val feederApiClientFactory: FeederApiClientFactory by lazy {
        FeederApiClientFactory(debugLogging = BuildConfig.DEBUG)
    }

    val feederRepository: FeederRepository by lazy { InMemoryFeederRepository() }

    val observeFeederSwitcherStateUseCase: ObserveFeederSwitcherStateUseCase by lazy {
        ObserveFeederSwitcherStateUseCase(feederRepository)
    }

    val selectFeederUseCase: SelectFeederUseCase by lazy { SelectFeederUseCase(feederRepository) }

    fun feedingApiFor(feeder: com.sdoras.petfeeder.core.feeder.Feeder): FeedingApi =
        feederApiClientFactory.serviceFor(feeder, FeedingApi::class.java)
}

package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.services.repositories.*
import com.sdoras.petfeeder.core.services.repositories.impl.*
import com.sdoras.petfeeder.core.services.retrofit.ServiceCall
import org.koin.core.module.Module
import org.koin.dsl.module

fun servicesModule(): Module {
    return module {

        single<FeederFinderRepository> { FeederFinderRepositoryImpl(get()) }
        single<FeederUrlRepository> { FeederUrlRepositoryImpl() }
        single<FeedingRepository> { FeedingRepositoryImpl(get()) }
        single<ScheduleRepository> { ScheduleRepositoryImpl(get()) }
        single<SettingsRepository> { SettingsRepositoryImpl(get()) }

        single<NotificationServices> { NotificationServicesImpl(get()) }
    }
}

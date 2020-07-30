package com.sdoras.petfeeder.core.services

import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.services.repositories.ScheduleRepository
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import org.koin.core.module.Module
import org.koin.dsl.module

fun servicesModule() : Module {
    return module {

        single { FeederUrlRepository() }
        single { FeedingRepository(get()) }
        single { ScheduleRepository(get()) }
        single { SettingsRepository(get()) }

        single { ServiceCall("http://192.168.86.204").create(RegistrationServices::class.java) }

        single<NotificationServices> { NotificationServicesImpl(get()) }
    }
}

package com.sdoras.petfeeder.core.services

import org.koin.core.module.Module
import org.koin.dsl.module

fun servicesModule() : Module {
    return module {
        single { ServiceCall("http://192.168.86.204").create(ScheduleServices::class.java) }
        single { ServiceCall("http://192.168.86.204").create(FeedingServices::class.java) }
        single { ServiceCall("http://192.168.86.204").create(SettingsServices::class.java) }
        single { ServiceCall("http://192.168.86.204").create(RegistrationServices::class.java) }

        single<NotificationServices> { NotificationServicesImpl(get()) }
    }
}

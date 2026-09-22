package com.sdoras.petfeeder

import android.app.Application
import com.sdoras.petfeeder.core.di.AppContainer

class PetFeederApplication : Application() {
    val container: AppContainer by lazy { AppContainer() }
}

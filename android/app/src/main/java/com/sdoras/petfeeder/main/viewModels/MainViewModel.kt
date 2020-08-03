package com.sdoras.petfeeder.main.viewModels

import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface MainViewModel : BaseViewModel {
    fun pauseFeederDiscovery()

    fun resumeFeederDiscovery()
}

package com.sdoras.petfeeder.main.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface MainViewModel : BaseViewModel {

    val feeders : LiveData<List<Feeder>>
    var feederUrl : String?

    fun pauseFeederDiscovery()

    fun resumeFeederDiscovery()

    data class Feeder(
            val name : String,
            val url : String
    ) {
        override fun toString(): String {
            return name
        }
    }
}

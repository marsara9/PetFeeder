package com.sdoras.petfeeder.dashboard.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface DashboardViewModel : BaseViewModel {
    val feeders : LiveData<Set<String>>
    val numberOfFeedingsToday : LiveData<Int>
    val totalCupsDispensedToday : LiveData<Double>

    var feederUrl : String?
}

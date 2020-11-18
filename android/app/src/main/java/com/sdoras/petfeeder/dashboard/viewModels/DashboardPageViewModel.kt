package com.sdoras.petfeeder.dashboard.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface DashboardPageViewModel : BaseViewModel {
    val name : LiveData<String>
    val numberOfFeedingsToday : LiveData<Int>
    val totalCupsDispensedToday : LiveData<Double>
}

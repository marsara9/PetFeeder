package com.sdoras.petfeeder.dashboard.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class DashboardViewModelImpl() : ViewModel(), DashboardViewModel {
    override val showLoading = MutableLiveData<Int>()
}

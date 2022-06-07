package com.sdoras.petfeeder.core.viewModels

import androidx.lifecycle.MutableLiveData

interface BaseViewModel {
    val showLoading: MutableLiveData<Int>
}

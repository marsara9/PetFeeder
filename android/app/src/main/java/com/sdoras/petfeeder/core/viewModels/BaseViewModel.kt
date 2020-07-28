package com.sdoras.petfeeder.core.viewModels

import androidx.lifecycle.LiveData

interface BaseViewModel {
    val showLoading : LiveData<Boolean>
}

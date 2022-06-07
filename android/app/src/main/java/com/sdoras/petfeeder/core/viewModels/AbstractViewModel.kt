package com.sdoras.petfeeder.core.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

abstract class AbstractViewModel : ViewModel(), BaseViewModel {

    final override val showLoading = MutableLiveData<Int>()
}

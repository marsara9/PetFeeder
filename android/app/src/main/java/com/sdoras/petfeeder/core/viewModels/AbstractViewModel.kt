package com.sdoras.petfeeder.core.viewModels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import io.reactivex.rxjava3.disposables.CompositeDisposable

abstract class AbstractViewModel : ViewModel(), BaseViewModel {

    final override val showLoading = MutableLiveData<Int>()

    protected val disposables = CompositeDisposable()

    override fun onCleared() {
        super.onCleared()

        disposables.clear()
    }
}

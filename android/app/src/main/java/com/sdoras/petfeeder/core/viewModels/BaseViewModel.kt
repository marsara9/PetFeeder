package com.sdoras.petfeeder.core.viewModels

import androidx.lifecycle.MutableLiveData
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.core.CompletableTransformer
import io.reactivex.rxjava3.core.ObservableTransformer
import io.reactivex.rxjava3.core.SingleTransformer
import io.reactivex.rxjava3.schedulers.Schedulers
import java.util.concurrent.TimeUnit

interface BaseViewModel {
    val showLoading : MutableLiveData<Boolean>

    fun applyDefaultCompletableRxSettings() : CompletableTransformer {
        return CompletableTransformer {
            it.doOnSubscribe { showLoading.postValue(true) }
                    .doAfterTerminate { showLoading.postValue(false) }
                    .subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
        }
    }

    fun <T> applyDefaultSingleRxSettings() : SingleTransformer<T, T> {
        return SingleTransformer {
            it.doOnSubscribe { showLoading.postValue(true) }
                    .doAfterTerminate { showLoading.postValue(false) }
                    .subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
        }
    }

    fun <T> applyDefaultObservableRxSettings() : ObservableTransformer<T, T> {
        return ObservableTransformer {
            it.doOnSubscribe { showLoading.postValue(true) }
                    .doAfterTerminate { showLoading.postValue(false) }
                    .subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
        }
    }
}

package com.sdoras.petfeeder.core.viewModels

import androidx.lifecycle.MutableLiveData
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.core.CompletableTransformer
import io.reactivex.rxjava3.core.ObservableTransformer
import io.reactivex.rxjava3.core.SingleTransformer
import io.reactivex.rxjava3.schedulers.Schedulers

interface BaseViewModel {

    val showLoading : MutableLiveData<Int>

    fun applyCompletableShowLoading() : CompletableTransformer {
        return CompletableTransformer {
            it.doOnSubscribe { showLoading.postValue( (showLoading.value ?: 0) + 1) }
                    .doAfterTerminate { showLoading.postValue((showLoading.value ?: 1) - 1) }
        }
    }

    fun <T> applySingleShowLoading() : SingleTransformer<T, T> {
        return SingleTransformer {
            it.doOnSubscribe { showLoading.postValue( (showLoading.value ?: 0) + 1) }
                    .doAfterTerminate { showLoading.postValue((showLoading.value ?: 1) - 1) }
        }
    }
    fun <T> applyObservableShowLoading() : ObservableTransformer<T, T> {
        return ObservableTransformer {
            it.doOnSubscribe { showLoading.postValue( (showLoading.value ?: 0) + 1) }
                    .doAfterTerminate { showLoading.postValue((showLoading.value ?: 1) - 1) }
        }
    }


    fun applyDefaultCompletableRxSettings() : CompletableTransformer {
        return CompletableTransformer {
            it.subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
        }
    }

    fun <T> applyDefaultSingleRxSettings() : SingleTransformer<T, T> {
        return SingleTransformer {
            it.subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
        }
    }

    fun <T> applyDefaultObservableRxSettings() : ObservableTransformer<T, T> {
        return ObservableTransformer {
            it.subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
        }
    }
}

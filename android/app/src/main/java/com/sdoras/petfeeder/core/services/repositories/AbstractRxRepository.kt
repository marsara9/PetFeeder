package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.services.ServiceCall
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.core.Single
import io.reactivex.rxjava3.schedulers.Schedulers
import io.reactivex.rxjava3.subjects.BehaviorSubject

abstract class AbstractRxRepository<S, T>(private val feederUrlRepository: FeederUrlRepository) : AbstractRepository<T>() {

    private val subject = BehaviorSubject.create<T>()
    protected var service : S? = null
        private set

    init {
        feederUrlRepository.get()
                .map {
                    service = ServiceCall(it).create(getServiceClass())
                }.flatMapCompletable { refresh() }
                .subscribe()
    }

    final override fun setFeederUrl(url : String) {
        feederUrlRepository.setFeederUrl(url)
    }

    fun refresh() : Completable {
        return service?.let {
            getServiceCall(it)
        }?.observeOn(AndroidSchedulers.mainThread())
                ?.subscribeOn(Schedulers.io())
                ?.doOnSuccess { subject.onNext(it) }
                ?.doOnError { subject.onError(it) }
                ?.ignoreElement()
                ?: Completable.complete()
    }

    final override fun get() : Observable<T> {
        return subject
    }

    protected abstract fun getServiceClass() : Class<S>

    protected abstract fun getServiceCall(service : S) : Single<T>
}

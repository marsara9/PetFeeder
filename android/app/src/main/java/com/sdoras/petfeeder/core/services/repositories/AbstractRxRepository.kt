package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.services.ServiceCall
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.core.Single
import io.reactivex.rxjava3.schedulers.Schedulers
import io.reactivex.rxjava3.subjects.BehaviorSubject
import java.lang.NullPointerException

abstract class AbstractRxRepository<S, T>(feederUrlRepository: FeederUrlRepository) : Repository<T> {

    private val subject = BehaviorSubject.create<T>()
    protected var service : S? = null
        private set

    init {
        feederUrlRepository.get()
                .map(::ServiceCall)
                .map { it.create(getServiceClass()).apply { service = this } }
                .switchMapCompletable(::refresh)
                .subscribe()
    }

    fun refresh() : Completable {
        return service?.let(::refresh)
                ?: Completable.error(NullPointerException("No FeederUrl was specified."))
    }

    private fun refresh(service: S) : Completable {
        return service.let(this::getServiceCall)
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeOn(Schedulers.io())
                .doOnSuccess { subject.onNext(it) }
                .doOnError { subject.onError(it) }
                .ignoreElement()
    }

    final override fun get() : Observable<T> {
        return subject.distinctUntilChanged()
    }

    protected abstract fun getServiceClass() : Class<S>

    protected abstract fun getServiceCall(service : S) : Single<T>
}

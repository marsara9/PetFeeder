package com.sdoras.petfeeder.core.services.repositories

import io.reactivex.rxjava3.core.Observable

abstract class AbstractRepository<T> {
    abstract fun setFeederUrl(url : String)

    abstract fun get() : Observable<T>
}

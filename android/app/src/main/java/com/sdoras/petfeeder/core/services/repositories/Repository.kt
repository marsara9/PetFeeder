package com.sdoras.petfeeder.core.services.repositories

import io.reactivex.rxjava3.core.Observable

interface Repository<T : Any> {
    fun get() : Observable<T>
}

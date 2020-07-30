package com.sdoras.petfeeder.core.services.repositories

import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.subjects.BehaviorSubject

class FeederUrlRepository : Repository<String> {

    private val subject = BehaviorSubject.create<String>()

    fun setFeederUrl(url: String) {
        subject.onNext(url)
    }

    fun getCurrent() : String? {
        return subject.value
    }

    override fun get(): Observable<String> {
        return subject.distinctUntilChanged()
    }
}

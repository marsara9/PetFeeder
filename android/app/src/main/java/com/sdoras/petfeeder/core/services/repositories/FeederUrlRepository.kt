package com.sdoras.petfeeder.core.services.repositories

import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.subjects.BehaviorSubject

class FeederUrlRepository : AbstractRepository<String>() {

    private val subject = BehaviorSubject.create<String>()

    override fun setFeederUrl(url: String) {
        subject.onNext(url)
    }

    override fun get(): Observable<String> {
        return subject
    }
}

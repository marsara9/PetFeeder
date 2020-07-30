package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.FeedingServices
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single

class FeedingRepository(feederUrlRepository: FeederUrlRepository) : AbstractRxRepository<FeedingServices, List<Feeding>>(feederUrlRepository) {

    override fun getServiceClass(): Class<FeedingServices> {
        return FeedingServices::class.java
    }

    override fun getServiceCall(service: FeedingServices): Single<List<Feeding>> {
        return service.getFeedingHistory()
    }

    fun manualFeed(cups : Float) : Completable? {
        return service?.manualFeed(cups)
    }
}

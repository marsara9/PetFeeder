package com.sdoras.petfeeder.core.services.repositories.impl

import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.FeedingServices
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.services.repositories.base.AbstractFeederRepository

class FeedingRepositoryImpl(
        feederUrlRepository: FeederUrlRepository
) : AbstractFeederRepository<FeedingServices, List<Feeding>>(
        feederUrlRepository, emptyList()
), FeedingRepository {

    override fun getServiceClass(): Class<FeedingServices> {
        return FeedingServices::class.java
    }

    override suspend fun invokeServiceCall(
            service: FeedingServices
    ) : List<Feeding> {
        return service.getFeedingHistory()
    }

    override suspend fun manualFeed(cups: Float) {
        checkNotNull(getService())
                .manualFeed(cups)
    }
}

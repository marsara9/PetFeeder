package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.base.Repository

interface FeedingRepository : Repository<List<Feeding>> {
    suspend fun manualFeed(cups : Float)
}

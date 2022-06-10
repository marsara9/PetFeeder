package com.sdoras.petfeeder.core.services.repositories.impl

import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.services.ScheduleServices
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.ScheduleRepository
import com.sdoras.petfeeder.core.services.repositories.base.AbstractFeederRepository

class ScheduleRepositoryImpl(
        feederUrlRepository: FeederUrlRepository
) : AbstractFeederRepository<ScheduleServices, List<ScheduledFeeding>>(
        feederUrlRepository, emptyList()
), ScheduleRepository {
    override fun getServiceClass(): Class<ScheduleServices> {
        return ScheduleServices::class.java
    }

    override suspend fun invokeServiceCall(service: ScheduleServices): List<ScheduledFeeding> {
        return service.getAllScheduledFeedings()
    }

    override suspend fun addScheduledFeeding(cups: Float, hour: Byte, minute: Byte) {
        checkNotNull(getService()).addScheduledFeeding(cups, hour, minute)
    }

    override suspend fun deleteScheduledFeeding(scheduledFeeding: ScheduledFeeding) {
        checkNotNull(getService()).deleteScheduledFeeding(scheduledFeeding.id)
    }
}

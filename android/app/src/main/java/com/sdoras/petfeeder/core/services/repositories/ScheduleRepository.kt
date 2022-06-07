package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.services.repositories.base.Repository

interface ScheduleRepository : Repository<List<ScheduledFeeding>> {

    suspend fun addScheduledFeeding(
            cups: Float,
            hour: Byte,
            minute: Byte
    )

    suspend fun deleteScheduledFeeding(scheduledFeeding: ScheduledFeeding)
}

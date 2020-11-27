package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.models.ScheduledFeeding
import com.sdoras.petfeeder.core.services.ScheduleServices
import io.reactivex.rxjava3.core.Completable
import io.reactivex.rxjava3.core.Single

class ScheduleRepository(
        feederUrlRepository: FeederUrlRepository
) : AbstractRxRepository<ScheduleServices, List<ScheduledFeeding>>(feederUrlRepository) {

    override fun getServiceClass(): Class<ScheduleServices> {
        return ScheduleServices::class.java
    }

    override fun getServiceCall(service: ScheduleServices): Single<List<ScheduledFeeding>> {
        return service.getAllScheduledFeedings()
    }

    fun addScheduledFeeding(cups : Float,
                            hour : Byte,
                            minute : Byte) : Completable? {
        return service?.addScheduledFeeding(cups, hour, minute)
    }

    fun deleteScheduledFeeding(scheduledFeeding: ScheduledFeeding) : Completable? {
        return service?.deleteScheduledFeeding(scheduledFeeding.id)
    }
}

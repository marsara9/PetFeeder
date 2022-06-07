package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.services.repositories.base.Repository

interface FeederUrlRepository : Repository<String?> {

    fun set(url : String?)

    fun getCurrent() : String?
}

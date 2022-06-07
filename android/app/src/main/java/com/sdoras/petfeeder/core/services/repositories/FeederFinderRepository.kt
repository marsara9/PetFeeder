package com.sdoras.petfeeder.core.services.repositories

import com.sdoras.petfeeder.core.services.repositories.base.Repository

interface FeederFinderRepository : Repository<Set<String>> {

    /**
     * Pauses discovery of new pet feeders.
     */
    fun pause()

    /**
     * Resumes discovery of new pet feeders.
     */
    fun resume()
}

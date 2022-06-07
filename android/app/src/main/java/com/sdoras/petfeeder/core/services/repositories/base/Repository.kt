package com.sdoras.petfeeder.core.services.repositories.base

import kotlinx.coroutines.flow.Flow

interface Repository<T> {

    fun init()

    /**
     * Gets the latest value from the repository.
     */
    fun get() : Flow<T>
}

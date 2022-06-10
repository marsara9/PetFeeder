package com.sdoras.petfeeder.core.services.repositories.impl

import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.filterNotNull

class FeederUrlRepositoryImpl : FeederUrlRepository {

    private val feederUrl = MutableStateFlow<String?>(null)

    override fun init() {
        set(null)
    }

    override fun get(): Flow<String> {
        return feederUrl.filterNotNull()
    }

    override fun set(url: String?) {
        feederUrl.value = url
    }

    override fun getCurrent(): String? {
        return feederUrl.value
    }
}


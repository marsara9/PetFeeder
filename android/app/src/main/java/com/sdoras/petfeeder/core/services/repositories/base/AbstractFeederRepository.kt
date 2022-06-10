package com.sdoras.petfeeder.core.services.repositories.base

import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.retrofit.ServiceCall
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

abstract class AbstractFeederRepository<S, T>(
        private val feederUrlRepository: FeederUrlRepository,
        defaultValue: T?
) : Repository<T> {

    private val channel = MutableStateFlow(defaultValue)

    init {
        CoroutineScope(Dispatchers.IO).launch {
            feederUrlRepository.get().map { url ->
                url?.let {
                    ServiceCall(it)
                }?.create(getServiceClass())
            }.map { service ->
                service?.let {
                    invokeServiceCall(it)
                }
            }.collect {
                channel.emit(it)
            }
        }
    }

    final override fun init() {
        CoroutineScope(Dispatchers.IO).launch {
            getService()?.let { service ->
                invokeServiceCall(service)
            }?.let {
                channel.emit(it)
            }
        }
    }

    final override fun get(): Flow<T> {
        return channel.filterNotNull()
    }

    protected suspend fun getService(): S? {
        return feederUrlRepository.get()
                .filterNotNull()
                .first()
                .let { url ->
                    ServiceCall(url).create(getServiceClass())
                }
    }

    protected abstract fun getServiceClass(): Class<S>

    protected abstract suspend fun invokeServiceCall(
            service: S
    ): T
}

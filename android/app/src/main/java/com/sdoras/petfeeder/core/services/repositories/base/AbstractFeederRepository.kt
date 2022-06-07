package com.sdoras.petfeeder.core.services.repositories.base

import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.retrofit.ServiceCall
import com.sdoras.petfeeder.core.utils.firstNotNull
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

abstract class AbstractFeederRepository<S, T>(
        feederUrlRepository: FeederUrlRepository,
        private val defaultValue: T
) : Repository<T> {

    private val service = MutableStateFlow<S?>(null)
    private val channel = MutableStateFlow(defaultValue)

    init {
        CoroutineScope(Dispatchers.IO).launch {
            service.collect { service ->
                service?.let {
                    invokeServiceCall(it)
                }?.let {
                    channel.emit(it)
                }
            }

            feederUrlRepository.get().map { url ->
                url?.let {
                    ServiceCall(it)
                }?.create(getServiceClass())
            }.collect {
                service.emit(it)
            }
        }
    }

    final override fun init() {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                service.firstNotNull().let {
                    channel.emit(invokeServiceCall(it))
                }
            } catch (exception: Exception) {
                channel.emit(defaultValue)
            }
        }
    }

    final override fun get(): Flow<T> {
        return channel
    }

    protected fun getService(): Flow<S?> {
        return service
    }

    protected abstract fun getServiceClass(): Class<S>

    protected abstract suspend fun invokeServiceCall(
            service: S
    ): T
}

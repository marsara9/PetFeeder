package com.sdoras.petfeeder.core.services.repositories.impl

import android.content.Context
import android.net.nsd.NsdServiceInfo
import com.sdoras.petfeeder.core.services.repositories.FeederFinderRepository
import com.sdoras.petfeeder.core.utils.NsdHelper
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.map
import java.net.InetAddress

class FeederFinderRepositoryImpl(
        context: Context
) : FeederFinderRepository, NsdHelper.Delegate {

    companion object {
        private const val SERVICE_TYPE = "_petfeeder._tcp."
        private const val SERVICE_NAME_PREFIX = "petfeeder_"
    }

    private val channel = MutableStateFlow<Map<String, InetAddress>>(emptyMap())
    private val nsdHelper = NsdHelper(context)

    override fun init() {
        channel.value = emptyMap()
    }

    override fun pause() {
        nsdHelper.stopDiscovery()
    }

    override fun resume() {
        nsdHelper.discoverServices(SERVICE_TYPE, SERVICE_NAME_PREFIX, this)
    }

    override fun get(): Flow<Set<String>> {
        return channel.map {
            it.map { value -> "http://${value.value}" }
        }.map(Iterable<String>::toSet)
    }

    override fun onServiceResolved(serviceInfo: NsdServiceInfo) {
        synchronized(this) {
            val map = channel.value.toMutableMap()
            if (!map.containsKey(serviceInfo.serviceName)) {
                serviceInfo.host?.let {
                    map[serviceInfo.serviceName] = it
                }
                channel.value = map
            }
        }
    }

    override fun onServiceLost(serviceInfo: NsdServiceInfo) {
        synchronized(this) {
            val map = channel.value.toMutableMap()
            if (map.containsKey(serviceInfo.serviceName)) {
                serviceInfo.let {
                    map.remove(it.serviceName)
                }
                channel.value = map
            }
        }
    }
}

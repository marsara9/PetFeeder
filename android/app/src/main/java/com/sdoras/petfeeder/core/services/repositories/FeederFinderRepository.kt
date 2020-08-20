package com.sdoras.petfeeder.core.services.repositories

import android.content.Context
import android.net.nsd.NsdServiceInfo
import com.sdoras.petfeeder.core.utils.NsdHelper
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.subjects.BehaviorSubject
import java.net.InetAddress
import java.util.*

class FeederFinderRepository(context: Context) : Repository<Set<String>>, NsdHelper.Delegate {

    companion object {
        private const val SERVICE_TYPE = "_petfeeder._tcp."
        private const val SERVICE_NAME_PREFIX = "petfeeder_"
    }

    private val subject = BehaviorSubject.create<Map<String, InetAddress>>()
    private val nsdHelper = NsdHelper(context)

    fun pause() {
        nsdHelper.stopDiscovery()
    }

    fun resume() {
        nsdHelper.discoverServices(SERVICE_TYPE, SERVICE_NAME_PREFIX, this)
    }

    override fun get(): Observable<Set<String>> {
        return subject
                .map { it.toSortedMap(Comparator { lhs, rhs -> lhs.compareTo(rhs) }) }
                .map {
                    it.values.map { value -> "http://${value.hostAddress}" }
                }.map { it.toSet() }
    }

    override fun onServiceResolved(serviceInfo: NsdServiceInfo) {
        synchronized(this) {
            val map = (subject.value ?: emptyMap()).toMutableMap()
            if (!map.containsKey(serviceInfo.serviceName)) {
                serviceInfo.host?.let {
                    map[serviceInfo.serviceName] = it
                }
                subject.onNext(map)
            }
        }
    }

    override fun onServiceLost(serviceInfo: NsdServiceInfo) {
        synchronized(this) {
            val map = (subject.value ?: emptyMap()).toMutableMap()
            if (map.containsKey(serviceInfo.serviceName)) {
                serviceInfo.let {
                    map.remove(it.serviceName)
                }
                subject.onNext(map)
            }
        }
    }
}

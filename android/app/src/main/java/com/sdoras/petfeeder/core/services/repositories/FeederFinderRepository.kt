package com.sdoras.petfeeder.core.services.repositories

import android.content.Context
import android.net.nsd.NsdServiceInfo
import com.sdoras.petfeeder.core.utils.NsdHelper
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.subjects.BehaviorSubject
import java.net.InetAddress
import java.util.*

class FeederFinderRepository(context: Context) : Repository<Set<String>> {

    private val subject = BehaviorSubject.create<Map<String, InetAddress>>()

    init {
        val nsdHelper = NsdHelper(context, "_petfeeder._tcp.", "petfeeder_", object : NsdHelper.Delegate {
            override fun onServiceResolved(serviceInfo: NsdServiceInfo) {
                synchronized(this@FeederFinderRepository) {
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
                synchronized(this@FeederFinderRepository) {
                    val map = (subject.value ?: emptyMap()).toMutableMap()
                    if (map.containsKey(serviceInfo.serviceName)) {
                        serviceInfo.let {
                            map.remove(it.serviceName)
                        }
                        subject.onNext(map)
                    }
                }
            }
        })
        nsdHelper.discoverServices()
    }

    override fun get(): Observable<Set<String>> {
        return subject
                .map { it.toSortedMap(Comparator { lhs, rhs -> lhs.compareTo(rhs) }) }
                .map { map ->
                    map.values.map {
                        "http://${it.hostAddress}"
                    }
                }.map { it.toSet() }
    }
}

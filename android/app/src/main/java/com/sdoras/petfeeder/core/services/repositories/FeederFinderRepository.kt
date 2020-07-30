package com.sdoras.petfeeder.core.services.repositories

import android.content.Context
import android.net.nsd.NsdManager
import android.net.nsd.NsdServiceInfo
import android.util.Log
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.subjects.BehaviorSubject
import java.net.InetAddress

class FeederFinderRepository(context: Context) : Repository<Map<String, InetAddress>> {

    private val discoveryListener = object : NsdManager.DiscoveryListener {
        override fun onServiceFound(serviceInfo: NsdServiceInfo?) {
            Log.d("NSD", serviceInfo?.serviceType ?: "no service type")
            Log.d("NSD", serviceInfo?.serviceName ?: "no service name")

            nsdManager.resolveService(serviceInfo, resolveListener)
        }

        override fun onStopDiscoveryFailed(serviceType: String?, errorCode: Int) {
            nsdManager.stopServiceDiscovery(this)
        }

        override fun onStartDiscoveryFailed(serviceType: String?, errorCode: Int) {
            nsdManager.stopServiceDiscovery(this)
        }

        override fun onDiscoveryStarted(serviceType: String?) {

        }

        override fun onDiscoveryStopped(serviceType: String?) {

        }

        override fun onServiceLost(serviceInfo: NsdServiceInfo?) {
            val map = (subject.value ?: emptyMap()).toMutableMap()
            serviceInfo?.let {
                map.remove(it.serviceName)
            }
            subject.onNext(map)
        }
    }

    private val resolveListener = object : NsdManager.ResolveListener {
        override fun onResolveFailed(serviceInfo: NsdServiceInfo?, errorCode: Int) {

        }

        override fun onServiceResolved(serviceInfo: NsdServiceInfo?) {
            val map = (subject.value ?: emptyMap()).toMutableMap()
            serviceInfo?.host?.let {
                map[serviceInfo.serviceName] = it
            }
            subject.onNext(map)
        }

    }

    private val subject = BehaviorSubject.create<Map<String, InetAddress>>()
    private val nsdManager : NsdManager = (context.getSystemService(Context.NSD_SERVICE) as NsdManager)

    init {
        nsdManager.discoverServices("_petfeeder._tcp", NsdManager.PROTOCOL_DNS_SD, discoveryListener)
    }

    override fun get(): Observable<Map<String, InetAddress>> {
        return subject
    }
}
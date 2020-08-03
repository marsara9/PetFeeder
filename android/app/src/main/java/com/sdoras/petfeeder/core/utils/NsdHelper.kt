package com.sdoras.petfeeder.core.utils

import android.content.Context
import android.net.nsd.NsdManager
import android.net.nsd.NsdServiceInfo
import android.util.Log
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.atomic.AtomicBoolean

class NsdHelper(context: Context) {

    private val nsdManager: NsdManager? = context.getSystemService(Context.NSD_SERVICE) as NsdManager?
    private var discoveryListener: NsdManager.DiscoveryListener? = null
    private var resolveListener: NsdManager.ResolveListener? = null
    private var resolveListenerBusy = AtomicBoolean(false)
    private var pendingNsdServices = ConcurrentLinkedQueue<NsdServiceInfo>()

    companion object {
        private const val TAG = "NsdHelper"
    }

    private fun createDiscoveryListener(serviceType : String, serviceNamePrefix : String?, delegate: Delegate) : NsdManager.DiscoveryListener {

        return object : NsdManager.DiscoveryListener {

            override fun onDiscoveryStarted(regType: String) {
                Log.d(TAG, "Service discovery started: $regType")
            }

            override fun onServiceFound(service: NsdServiceInfo) {
                Log.d(TAG, "Service discovery success: $service")

                if (service.serviceType == serviceType && (serviceNamePrefix?.let { service.serviceName.startsWith(it) } != false)) {
                    if (resolveListenerBusy.compareAndSet(false, true)) {
                        nsdManager?.resolveService(service, resolveListener)
                    } else {
                        pendingNsdServices.add(service)
                    }
                } else {
                    Log.d(TAG, "Not our Service - Name: ${service.serviceName}, Type: ${service.serviceType}")
                }
            }

            override fun onServiceLost(service: NsdServiceInfo) {
                Log.d(TAG, "Service lost: $service")

                val iterator = pendingNsdServices.iterator()
                while (iterator.hasNext()) {
                    if (iterator.next().serviceName == service.serviceName) {
                        iterator.remove()
                    }
                }

                delegate.onServiceLost(service)
            }

            override fun onDiscoveryStopped(serviceType: String) {
                Log.d(TAG, "Discovery stopped: $serviceType")
            }

            override fun onStartDiscoveryFailed(serviceType: String, errorCode: Int) {
                Log.e(TAG, "Start Discovery failed: Error code: $errorCode")
                stopDiscovery()
            }

            override fun onStopDiscoveryFailed(serviceType: String, errorCode: Int) {
                Log.e(TAG, "Stop Discovery failed: Error code: $errorCode")
                nsdManager?.stopServiceDiscovery(this)
            }
        }
    }

    private fun createResolveListener(delegate: Delegate) : NsdManager.ResolveListener {
        return object : NsdManager.ResolveListener {

            override fun onServiceResolved(service: NsdServiceInfo) {
                Log.d(TAG, "Resolve Succeeded: $service")

                delegate.onServiceResolved(service)

                resolveNextInQueue()
            }

            override fun onResolveFailed(serviceInfo: NsdServiceInfo, errorCode: Int) {
                Log.e(TAG, "Resolve failed: $serviceInfo - Error code: $errorCode")
                resolveNextInQueue()
            }
        }
    }

    fun discoverServices(serviceType : String, serviceNamePrefix : String?, delegate: Delegate) {
        check(discoveryListener == null) { "Discovery Services are already running.  Please stop the current discovery if you wish to start another." }

        resolveListener = createResolveListener(delegate)
        discoveryListener = createDiscoveryListener(serviceType, serviceNamePrefix, delegate)
        nsdManager?.discoverServices(serviceType, NsdManager.PROTOCOL_DNS_SD, discoveryListener)
    }

    fun stopDiscovery() {
        discoveryListener?.let {
            nsdManager?.stopServiceDiscovery(discoveryListener)
            discoveryListener = null
            resolveListener = null
            resolveListenerBusy.set(false)
        }
    }

    private fun resolveNextInQueue() {
        val nextNsdService = pendingNsdServices.poll()
        nextNsdService?.let {
            nsdManager?.resolveService(nextNsdService, resolveListener)
        } ?: resolveListenerBusy.set(false)
    }

    interface Delegate {
        fun onServiceResolved(serviceInfo: NsdServiceInfo)
        fun onServiceLost(serviceInfo: NsdServiceInfo)
    }
}

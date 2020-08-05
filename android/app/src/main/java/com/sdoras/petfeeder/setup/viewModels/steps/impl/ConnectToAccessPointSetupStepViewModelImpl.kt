package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.annotation.TargetApi
import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.os.Build
import com.sdoras.petfeeder.setup.viewModels.steps.ConnectToAccessPointSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import io.reactivex.rxjava3.core.Completable

class ConnectToAccessPointSetupStepViewModelImpl(context: Context) : AbstractSetupStepViewModel(), ConnectToAccessPointSetupStepViewModel {

    init {

    }

    private fun connectToFeederAccessPoint(context: Context, ssid: String) : Completable {
        return if(Build.VERSION.SDK_INT >= 29) {
            connectToFeederAccessPointNew(context, ssid)
        } else {
            connectToFeederAccessPointLegacy(context, ssid)
        }
    }

    @TargetApi(29)
    private fun connectToFeederAccessPointNew(context: Context, ssid : String) : Completable {
        return Completable.create {
            val specifier = WifiNetworkSpecifier.Builder()
                    .setSsid(ssid)
                    .build()
            val request = NetworkRequest.Builder()
                    .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
                    .removeCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    .setNetworkSpecifier(specifier)
                    .build()

            val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            val networkCallback = object : ConnectivityManager.NetworkCallback() {
                override fun onAvailable(network: Network) {
                    super.onAvailable(network)

                    it.onComplete()
                }

                override fun onUnavailable() {
                    super.onUnavailable()

                    it.onError(RuntimeException("Could not find associated network."))
                }
            }
            connectivityManager.requestNetwork(request, networkCallback)
        }
    }

    @Suppress("DEPRECATION")
    private fun connectToFeederAccessPointLegacy(context: Context, ssid: String) : Completable {
        val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

        val configuration = WifiConfiguration()
        configuration.SSID = "\"$ssid\""
        configuration.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.NONE)
        configuration.allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN)

        val networkId = wifiManager.addNetwork(configuration)
        wifiManager.isWifiEnabled = true
        if(networkId != -1) {
            wifiManager.disconnect()
            wifiManager.enableNetwork(networkId, true)
            wifiManager.reconnect()
        }

        return Completable.complete()
    }
}
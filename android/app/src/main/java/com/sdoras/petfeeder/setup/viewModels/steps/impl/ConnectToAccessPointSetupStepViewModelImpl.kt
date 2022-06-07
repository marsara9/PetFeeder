package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.annotation.TargetApi
import android.content.Context
import android.net.*
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.os.Build
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.setup.viewModels.steps.ConnectToAccessPointSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import kotlinx.coroutines.launch
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine

class ConnectToAccessPointSetupStepViewModelImpl : AbstractSetupStepViewModel(), ConnectToAccessPointSetupStepViewModel {

    override val ssid = MutableLiveData<String>()

    override fun setSSID(
            context: Context,
            ssid: String,
            bssid: MacAddress?
    ) {
        this.ssid.postValue(ssid)
        viewModelScope.launch {
            connectToFeederAccessPoint(context, ssid, bssid)
        }
    }

    private suspend fun connectToFeederAccessPoint(
            context: Context,
            ssid: String,
            bssid: MacAddress?
    ) {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            connectToFeederAccessPointNew(context, ssid, bssid)
        } else {
            connectToFeederAccessPointLegacy(context, ssid, bssid?.toString())
        }
    }

    @TargetApi(Build.VERSION_CODES.Q)
    private suspend fun connectToFeederAccessPointNew(
            context: Context,
            ssid: String,
            bssid: MacAddress?
    ) {
        suspendCoroutine<Unit> { continuation ->
            val specifier = WifiNetworkSpecifier.Builder()
                    .setSsid(ssid)
                    .apply {
                        if (bssid != null) {
                            setBssid(bssid)
                        }
                    }.build()
            val request = NetworkRequest.Builder()
                    .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
                    .removeCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    .setNetworkSpecifier(specifier)
                    .build()

            val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            val networkCallback = object : ConnectivityManager.NetworkCallback() {
                override fun onAvailable(network: Network) {
                    super.onAvailable(network)

                    continuation.resume(Unit)
                }

                override fun onUnavailable() {
                    super.onUnavailable()

                    continuation.resumeWithException(RuntimeException("Could not find associated network."))
                }
            }
            connectivityManager.requestNetwork(request, networkCallback)
        }
    }

    @Suppress("DEPRECATION")
    private fun connectToFeederAccessPointLegacy(
            context: Context,
            ssid: String,
            bssid: String?
    ) {
        val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

        val configuration = WifiConfiguration()
        configuration.SSID = "\"$ssid\""
        configuration.BSSID = "\"$bssid\""
        configuration.status = WifiConfiguration.Status.ENABLED
        configuration.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.NONE)
        configuration.allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN)

        val networkId = wifiManager.addNetwork(configuration)
        wifiManager.isWifiEnabled = true
        if (networkId != -1) {
            wifiManager.disconnect()
            wifiManager.enableNetwork(networkId, true)
            wifiManager.reconnect()
        }
    }
}

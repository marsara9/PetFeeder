package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.annotation.TargetApi
import android.content.Context
import android.net.*
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.os.Build
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.setup.viewModels.steps.ConnectToAccessPointSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import io.reactivex.rxjava3.core.Completable

class ConnectToAccessPointSetupStepViewModelImpl(private val context: Context) : AbstractSetupStepViewModel(), ConnectToAccessPointSetupStepViewModel {

    init {

    }

    override val ssid = MutableLiveData<String>()

    override fun setSSID(ssid: String, bssid : MacAddress?) {
        this.ssid.postValue(ssid)
        connectToFeederAccessPoint(context, ssid, bssid)
    }

    override fun onNext() {

    }

    private fun connectToFeederAccessPoint(context: Context, ssid: String, bssid: MacAddress?) : Completable {
        return if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            connectToFeederAccessPointNew(context, ssid, bssid)
        } else {
            connectToFeederAccessPointLegacy(context, ssid, bssid?.toString())
        }
    }

    @TargetApi(Build.VERSION_CODES.Q)
    private fun connectToFeederAccessPointNew(context: Context, ssid : String, bssid: MacAddress?) : Completable {
        return Completable.create {
            val specifier = WifiNetworkSpecifier.Builder()
                    .setSsid(ssid)
                    .apply {
                        if(bssid != null) {
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
    private fun connectToFeederAccessPointLegacy(context: Context, ssid: String, bssid: String?) : Completable {
        val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

        val configuration = WifiConfiguration()
        configuration.SSID = "\"$ssid\""
        configuration.BSSID = "\"$bssid\""
        configuration.status = WifiConfiguration.Status.ENABLED
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

package com.sdoras.petfeeder.setup.viewModels

import android.annotation.TargetApi
import android.content.Context
import android.graphics.drawable.Drawable
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.os.Build
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.services.repositories.SettingsRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.IntroductionStep
import com.sdoras.petfeeder.setup.viewModels.steps.ScanStep
import com.sdoras.petfeeder.setup.viewModels.steps.SetupStep
import io.reactivex.rxjava3.core.Completable

class SetupViewModelImpl(private val context : Context, settingsRepository: SettingsRepository) : AbstractViewModel(), SetupViewModel {

    override val image = MutableLiveData<Drawable>()
    override val status = MutableLiveData<String>()
    override val message = MutableLiveData<String>()
    override val isNextVisible = MutableLiveData<Boolean>()
    override val isCancelVisible = MutableLiveData<Boolean>()
    override val isNextEnabled = MutableLiveData<Boolean>()
    override val isCancelEnabled = MutableLiveData<Boolean>()

    private val steps = listOf(
            IntroductionStep(),
            ScanStep()
    )
    private var stepIndex = 0

    init {
        initializeStep(steps[stepIndex])
    }

    fun initializeStep(setupStep: SetupStep) {
        message.value = setupStep.message
        image.value = setupStep.image?.let {
            context.getDrawable(it)
        }

        status.value = ""
        isNextVisible.value = true
        isCancelVisible.value = false
        isNextEnabled.value = true
        isCancelEnabled.value = true

        setupStep.onStart(context)
    }

    override fun onNext() {
        stepIndex++
        initializeStep(steps[stepIndex])
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
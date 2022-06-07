package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.wifi.WifiManager
import android.os.Bundle
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import com.sdoras.petfeeder.setup.views.steps.ConnectToAccessPointSetupStepFragment
import kotlinx.coroutines.launch
import kotlinx.coroutines.withTimeout
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine

class ScanForFeedersSetupStepViewModelImpl(
        context: Context
) : AbstractSetupStepViewModel(), ScanForFeedersSetupStepViewModel {

    override val status = MutableLiveData<Int>()
    override val message = MutableLiveData<Int>()
    override val isTryAgainVisible = MutableLiveData<Boolean>()
    override val ssids = MutableLiveData<List<String>>()

    override var selectedSSID: String? = null

    init {
        viewModelScope.launch {
            tryAgain(context)
        }
    }

    private suspend fun findFeeders(context: Context): List<String> {
        return suspendCoroutine { continuation ->
            val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

            val broadcastReceiver = object : BroadcastReceiver() {
                override fun onReceive(context: Context?, intent: Intent?) {
                    if (intent?.action == WifiManager.SCAN_RESULTS_AVAILABLE_ACTION) {

                        continuation.resume(wifiManager.scanResults
                                .filter { it.SSID.startsWith("petfeeder_") }
                                .map { it.SSID }
                        )

                        context?.unregisterReceiver(this)
                    }
                }
            }

            context.registerReceiver(broadcastReceiver, IntentFilter(WifiManager.SCAN_RESULTS_AVAILABLE_ACTION))
            wifiManager.startScan()
        }
    }

    override fun tryAgain(context: Context) {
        status.value = R.string.setup_scan_status_scanning
        message.value = R.string.setup_scan_message_notice
        isTryAgainVisible.value = false
        ssids.value = emptyList()

        try {
            viewModelScope.launch {
                withTimeout(30_000) {
                    val feeders = findFeeders(context)

                    when (feeders.size) {
                        0 -> {
                            status.value = R.string.setup_scan_status_no_feeders_found
                            message.value = R.string.setup_scan_message_notice
                        }
                        1 -> {
                            selectedSSID = feeders.first()
                            next()
                        }
                        else -> {
                            status.value = R.string.setup_scan_status_found_multiple
                            message.value = R.string.setup_scan_message_found_multiple
                        }
                    }

                    ssids.value = feeders
                    isTryAgainVisible.value = true
                }
            }
        } catch (exception : Exception) {
            status.value = R.string.setup_scan_status_error
            message.value = R.string.setup_scan_message_error
            ssids.value = emptyList()
        }
    }

    override fun next() {
        checkNotNull(selectedSSID)

        delegate?.goToNextStep(Bundle().apply {
            putString(ConnectToAccessPointSetupStepFragment.EXTRA_SSID, selectedSSID)
        })
    }
}

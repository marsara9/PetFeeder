package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.wifi.WifiManager
import android.os.Bundle
import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import com.sdoras.petfeeder.setup.views.steps.ConnectToAccessPointSetupStepFragment
import io.reactivex.rxjava3.core.Single
import java.util.concurrent.TimeUnit

class ScanForFeedersSetupStepViewModelImpl(
        val context: Context
) : AbstractSetupStepViewModel(), ScanForFeedersSetupStepViewModel {

    override val status = MutableLiveData<Int>()
    override val message = MutableLiveData<Int>()
    override val isTryAgainVisible = MutableLiveData<Boolean>()
    override val ssids = MutableLiveData<List<String>>()

    override var selectedSSID: String? = null

    init {
        tryAgain()
    }

    private fun findFeeders(context: Context): Single<List<String>> {
        return Single.create { emitter ->
            val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

            val broadcastReceiver = object : BroadcastReceiver() {
                override fun onReceive(context: Context?, intent: Intent?) {
                    if (intent?.action == WifiManager.SCAN_RESULTS_AVAILABLE_ACTION) {
                        emitter.onSuccess(wifiManager.scanResults
                                .filter { it.SSID.startsWith("petfeeder_") }
                                .map { it.SSID })

                        context?.unregisterReceiver(this)
                    }
                }
            }

            context.registerReceiver(broadcastReceiver, IntentFilter(WifiManager.SCAN_RESULTS_AVAILABLE_ACTION))
            wifiManager.startScan()
        }
    }

    override fun tryAgain() {
        status.value = R.string.setup_scan_status_scanning
        message.value = R.string.setup_scan_message_notice
        isTryAgainVisible.value = false
        ssids.value = emptyList()

        findFeeders(context)
                .timeout(30, TimeUnit.SECONDS)
                .delaySubscription(30, TimeUnit.SECONDS)
                .subscribe({
                    when (it.size) {
                        0 -> {
                            status.value = R.string.setup_scan_status_no_feeders_found
                            message.value = R.string.setup_scan_message_notice
                        }
                        1 -> {
                            selectedSSID = it.first()
                            next()
                        }
                        else -> {
                            status.value = R.string.setup_scan_status_found_multiple
                            message.value = R.string.setup_scan_message_found_multiple
                        }
                    }
                    ssids.value = it
                    isTryAgainVisible.value = true
                }, {
                    status.value = R.string.setup_scan_status_error
                    message.value = R.string.setup_scan_message_error
                    ssids.value = emptyList()
                })
    }

    override fun next() {
        checkNotNull(selectedSSID)

        delegate?.goToNextStep(Bundle().apply {
            putString(ConnectToAccessPointSetupStepFragment.EXTRA_SSID, selectedSSID)
        })
    }
}

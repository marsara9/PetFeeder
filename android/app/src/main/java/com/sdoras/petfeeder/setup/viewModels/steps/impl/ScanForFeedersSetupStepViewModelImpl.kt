package com.sdoras.petfeeder.setup.viewModels.steps.impl

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.wifi.WifiManager
import com.sdoras.petfeeder.setup.viewModels.steps.ScanForFeedersSetupStepViewModel
import com.sdoras.petfeeder.setup.viewModels.steps.base.AbstractSetupStepViewModel
import io.reactivex.rxjava3.core.Single
import java.util.concurrent.TimeUnit

class ScanForFeedersSetupStepViewModelImpl(context: Context) : AbstractSetupStepViewModel(), ScanForFeedersSetupStepViewModel {

    init {
        findFeeders(context)
                .timeout(10, TimeUnit.SECONDS)
                .subscribe({
                    val s = it
                }, {

                })
    }

    private fun findFeeders(context: Context) : Single<List<String>> {
        return Single.create { emitter ->
            val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

            val broadcastReceiver = object : BroadcastReceiver() {
                override fun onReceive(context: Context?, intent: Intent?) {
                    if(intent?.action == WifiManager.SCAN_RESULTS_AVAILABLE_ACTION) {
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
}

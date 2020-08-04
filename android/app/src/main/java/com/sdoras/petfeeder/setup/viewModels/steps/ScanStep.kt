package com.sdoras.petfeeder.setup.viewModels.steps

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.wifi.ScanResult
import android.net.wifi.WifiManager
import io.reactivex.rxjava3.core.Single
import java.util.concurrent.TimeUnit

class ScanStep : SetupStep {
    override val message = ""
    override val image: Int? = null

    fun findFeeders(context: Context) : Single<List<String>> {
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

    override fun onStart(context: Context) {

        findFeeders(context)
                .timeout(10, TimeUnit.SECONDS)
                .subscribe({
                    val s = it
                }, {

                })

    }
}
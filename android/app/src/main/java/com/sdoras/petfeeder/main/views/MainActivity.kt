package com.sdoras.petfeeder.main.views

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.dashboard.views.DashboardFragment
import com.sdoras.petfeeder.history.views.HistoryFragment
import com.sdoras.petfeeder.schedules.views.SchedulesFragment
import com.sdoras.petfeeder.settings.views.SettingsFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private val onNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.navigation_home -> {
                supportFragmentManager.beginTransaction()
                        .replace(R.id.frame, DashboardFragment())
                        .commit()
                true
            }
            R.id.navigation_schedules -> {
                supportFragmentManager.beginTransaction()
                        .replace(R.id.frame, SchedulesFragment())
                        .commit()
                true
            }
            R.id.navigation_history -> {
                supportFragmentManager.beginTransaction()
                        .replace(R.id.frame, HistoryFragment())
                        .commit()
                true
            }
            R.id.navigation_settings -> {
                supportFragmentManager.beginTransaction()
                        .replace(R.id.frame, SettingsFragment())
                        .commit()
                true
            }
            else -> false
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        navigation.setOnNavigationItemSelectedListener(onNavigationItemSelectedListener)

        supportFragmentManager.beginTransaction()
                .replace(R.id.frame, DashboardFragment())
                .commit()
    }
}

package com.sdoras.petfeeder.main.views

import android.content.Intent
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationBarView
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.dashboard.views.DashboardPageFragment
import com.sdoras.petfeeder.databinding.ActivityMainBinding
import com.sdoras.petfeeder.history.views.HistoryFragment
import com.sdoras.petfeeder.main.viewModels.MainViewModelImpl
import com.sdoras.petfeeder.schedules.views.SchedulesFragment
import com.sdoras.petfeeder.settings.views.SettingsFragment
import com.sdoras.petfeeder.setup.views.SetupActivity
import org.koin.androidx.viewmodel.ext.android.viewModel

class MainActivity : AppCompatActivity() {

    private var currentTab = R.id.navigation_home
    private val viewModel by viewModel<MainViewModelImpl>()

    private lateinit var binding: ActivityMainBinding

    private val onNavigationItemSelectedListener = NavigationBarView.OnItemSelectedListener { item ->
        if(item.itemId == currentTab) {
            true
        } else {
            when (item.itemId) {
                R.id.navigation_home -> {
                    supportFragmentManager.beginTransaction()
                            .replace(R.id.frame, DashboardPageFragment())
                            .commit()
                    currentTab = item.itemId
                    true
                }
                R.id.navigation_schedules -> {
                    supportFragmentManager.beginTransaction()
                            .replace(R.id.frame, SchedulesFragment())
                            .commit()
                    currentTab = item.itemId
                    true
                }
                R.id.navigation_history -> {
                    supportFragmentManager.beginTransaction()
                            .replace(R.id.frame, HistoryFragment())
                            .commit()
                    currentTab = item.itemId
                    true
                }
                R.id.navigation_settings -> {
                    supportFragmentManager.beginTransaction()
                            .replace(R.id.frame, SettingsFragment())
                            .commit()
                    currentTab = item.itemId
                    true
                }
                else -> false
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        setSupportActionBar(binding.actionBar)

        binding.navigation.setOnItemSelectedListener(onNavigationItemSelectedListener)

        supportFragmentManager.beginTransaction()
                .replace(R.id.frame, DashboardPageFragment())
                .commit()

        viewModel.feeders.observe(this) {
            binding.spinnerFeeders.adapter = ArrayAdapter(this, android.R.layout.simple_spinner_dropdown_item, it)
            binding.spinnerFeeders.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {

                override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                    viewModel.feederUrl = it[position].url
                }

                override fun onNothingSelected(parent: AdapterView<*>?) {

                }
            }
        }
    }

    override fun onPause() {
        super.onPause()

        viewModel.pauseFeederDiscovery()
    }

    override fun onResume() {
        super.onResume()

        viewModel.resumeFeederDiscovery()
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when(item.itemId) {
            R.id.setup -> {
                val intent = Intent(this, SetupActivity::class.java)
                startActivity(intent)
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}

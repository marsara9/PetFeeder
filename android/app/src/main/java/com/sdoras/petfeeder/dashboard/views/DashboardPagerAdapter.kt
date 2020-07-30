package com.sdoras.petfeeder.dashboard.views

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter

class DashboardPagerAdapter(private val feeders : Int, fragmentActivity: FragmentActivity) : FragmentStateAdapter(fragmentActivity) {

    override fun getItemCount(): Int {
        return feeders
    }

    override fun createFragment(position: Int): Fragment {
        return DashboardPageFragment()
    }
}

package com.sdoras.petfeeder.dashboard.views

import android.os.Bundle
import android.view.View
import androidx.viewpager2.widget.ViewPager2
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.dashboard.viewModels.DashboardViewModel
import com.sdoras.petfeeder.dashboard.viewModels.DashboardViewModelImpl
import com.sdoras.petfeeder.databinding.FragmentDashboardBinding
import org.koin.androidx.viewmodel.ext.android.viewModel

class DashboardFragment : DataBoundFragment<DashboardViewModel, FragmentDashboardBinding>() {
    override val layoutId = R.layout.fragment_dashboard
    override val viewModel by viewModel<DashboardViewModelImpl>()
    override val clickHandler: ClickHandler<DashboardViewModel>? = null

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val pager = view.findViewById<ViewPager2>(R.id.pager)

        pager.adapter = DashboardPagerAdapter(activity!!);
    }
}

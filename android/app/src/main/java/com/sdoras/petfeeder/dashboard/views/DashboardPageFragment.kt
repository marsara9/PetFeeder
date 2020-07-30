package com.sdoras.petfeeder.dashboard.views

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.dashboard.viewModels.DashboardPageViewModel
import com.sdoras.petfeeder.dashboard.viewModels.DashboardPageViewModelImpl
import com.sdoras.petfeeder.databinding.FragmentPageDashboardBinding
import org.koin.androidx.viewmodel.ext.android.viewModel

class DashboardPageFragment : DataBoundFragment<DashboardPageViewModel, FragmentPageDashboardBinding>() {
    override val layoutId = R.layout.fragment_page_dashboard
    override val viewModel by viewModel<DashboardPageViewModelImpl>()
    override val clickHandler: ClickHandler<DashboardPageViewModel>? = null
}

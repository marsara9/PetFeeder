package com.sdoras.petfeeder.dashboard.views

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
}

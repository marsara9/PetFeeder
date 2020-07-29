package com.sdoras.petfeeder.schedules.views

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentSchedulesBinding
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModel
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class SchedulesFragment : DataBoundFragment<SchedulesViewModel, FragmentSchedulesBinding>() {
    override val layoutId = R.layout.fragment_schedules
    override val viewModel by viewModel<SchedulesViewModelImpl>()
    override val clickHandler by clickHandler<SchedulesClickHandler>()
}

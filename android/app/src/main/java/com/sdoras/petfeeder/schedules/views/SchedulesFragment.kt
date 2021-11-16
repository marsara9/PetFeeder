package com.sdoras.petfeeder.schedules.views

import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.LinearLayoutManager
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

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding.recyclerView.layoutManager = LinearLayoutManager(context)

        viewModel.schedules.observe(viewLifecycleOwner, {
            binding.recyclerView.adapter = SchedulesAdapter(it).apply {
                delegate = clickHandler
            }
        })
    }
}

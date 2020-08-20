package com.sdoras.petfeeder.history.views

import android.os.Bundle
import android.view.View
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.DataBoundFragment
import com.sdoras.petfeeder.databinding.FragmentHistoryBinding
import com.sdoras.petfeeder.history.viewModels.HistoryViewModel
import com.sdoras.petfeeder.history.viewModels.HistoryViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class HistoryFragment : DataBoundFragment<HistoryViewModel, FragmentHistoryBinding>() {
    override val layoutId = R.layout.fragment_history
    override val viewModel by viewModel<HistoryViewModelImpl>()
    override val clickHandler by clickHandler<HistoryClickHandler>()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        
        binding.recyclerView.layoutManager = LinearLayoutManager(context)

        viewModel.history.observe(viewLifecycleOwner, Observer {
            binding.recyclerView.adapter = HistoryAdapter(it)
        })
    }
}

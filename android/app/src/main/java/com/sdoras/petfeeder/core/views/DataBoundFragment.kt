package com.sdoras.petfeeder.core.views

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

abstract class DataBoundFragment<Binding : ViewDataBinding> : Fragment() {

    protected abstract val layoutId : Int

    protected abstract val viewModel : BaseViewModel

    protected lateinit var binding: Binding

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = DataBindingUtil.inflate<Binding>(inflater, layoutId, container, false)
        binding.setVariable(BR.viewModel, viewModel)
        binding.lifecycleOwner = this

        viewModel.showLoading.observe(this, Observer {
            activity?.runOnUiThread {
                if(it) {
                    childFragmentManager.beginTransaction()
                            .add(ProgressFragment(), "progress")
                            .commit()
                } else {
                    childFragmentManager.findFragmentByTag("progress")?.let { progressFragment ->
                        childFragmentManager.beginTransaction()
                                .remove(progressFragment)
                                .commit()
                    }
                }
            }
        })

        return binding.root
    }
}

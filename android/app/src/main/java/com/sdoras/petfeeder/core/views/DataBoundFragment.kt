package com.sdoras.petfeeder.core.views

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import com.sdoras.petfeeder.core.views.dialogs.ProgressDialog
import org.koin.core.parameter.DefinitionParameters
import org.koin.core.parameter.ParametersDefinition
import org.koin.core.parameter.parametersOf

abstract class DataBoundFragment<Binding : ViewDataBinding> : Fragment() {

    protected abstract val layoutId : Int
    protected abstract val viewModel : BaseViewModel
    protected abstract val clickHandler : Any?

    protected lateinit var binding: Binding

    private var progressDialog : ProgressDialog? = null

    protected fun injectViewModel() : ParametersDefinition {
        return object : ParametersDefinition {
            override fun invoke(): DefinitionParameters = parametersOf(viewModel)
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = DataBindingUtil.inflate(inflater, layoutId, container, false)
        binding.setVariable(BR.viewModel, viewModel)
        binding.setVariable(BR.clickHandler, clickHandler)
        binding.lifecycleOwner = this

        viewModel.showLoading.observe(this, Observer {
            activity?.runOnUiThread {
                if(it) {
                    context?.let {
                        if(progressDialog == null) {
                            progressDialog = ProgressDialog(it)
                        }
                        progressDialog?.show()
                    }
                } else {
                    progressDialog?.dismiss()
                }
            }
        })

        return binding.root
    }
}

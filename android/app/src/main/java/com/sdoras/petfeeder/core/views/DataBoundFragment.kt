package com.sdoras.petfeeder.core.views

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModel
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import com.sdoras.petfeeder.core.views.dialogs.ProgressDialog
import org.koin.android.ext.android.getKoin
import org.koin.core.parameter.DefinitionParameters
import org.koin.core.parameter.ParametersDefinition
import org.koin.core.parameter.parametersOf

abstract class DataBoundFragment<VM : BaseViewModel, Binding : ViewDataBinding> : Fragment() {

    abstract val layoutId : Int
    abstract val viewModel : VM
    abstract val clickHandler : ClickHandler<VM>?

    protected lateinit var binding: Binding

    private var progressDialog : ProgressDialog? = null

    protected inline fun <reified T : ClickHandler<in VM>> clickHandler() = lazy {
        getKoin().get<T> {
            parametersOf(viewModel)
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

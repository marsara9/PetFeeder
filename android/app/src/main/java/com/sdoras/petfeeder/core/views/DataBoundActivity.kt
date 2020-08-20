package com.sdoras.petfeeder.core.views

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.lifecycle.Observer
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import com.sdoras.petfeeder.core.views.dialogs.ProgressDialog
import org.koin.android.ext.android.getKoin
import org.koin.core.parameter.parametersOf
import kotlin.reflect.KClass

abstract class DataBoundActivity<VM : BaseViewModel, Binding : ViewDataBinding> : AppCompatActivity() {

    abstract val layoutId : Int
    abstract val viewModel : VM
    abstract val clickHandler : ClickHandler<VM>?

    protected lateinit var binding: Binding

    private var progressDialog : ProgressDialog? = null

    protected inline fun <reified T : ClickHandler<in VM>> clickHandler() = clickHandler(T::class)

    protected fun <T : ClickHandler<in VM>> clickHandler(clazz: KClass<T>) = lazy {
        getKoin().get<T>(clazz, null) {
            parametersOf(viewModel)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = DataBindingUtil.setContentView(this, layoutId)
        binding.setVariable(BR.viewModel, viewModel)
        binding.setVariable(BR.clickHandler, clickHandler)
        binding.lifecycleOwner = this

        viewModel.showLoading.observe(this, Observer {
            if(it > 0) {
                Handler(Looper.getMainLooper()).post {
                    if(progressDialog == null) {
                        progressDialog = ProgressDialog(this)
                    }
                    progressDialog?.show()
                }
            } else {
                Handler(Looper.getMainLooper()).postDelayed({
                    if(it == 0) {
                        progressDialog?.dismiss()
                    }
                }, 100)
            }
        })
    }
}

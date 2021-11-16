package com.sdoras.petfeeder.core.views

import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.fragment.app.DialogFragment
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.core.viewModels.BaseViewModel
import com.sdoras.petfeeder.core.views.dialogs.ProgressDialog
import org.koin.android.ext.android.getKoin
import org.koin.core.parameter.parametersOf
import kotlin.reflect.KClass

abstract class DataBoundDialogFragment<VM : BaseViewModel, Binding : ViewDataBinding> : DialogFragment() {

    abstract val layoutId : Int
    abstract val viewModel : VM
    abstract val clickHandler : DialogClickHandler<VM>?

    var positiveButtonClickListener : View.OnClickListener? = null
    var negativeButtonClickListener : View.OnClickListener? = null
    var neutralButtonClickListener : View.OnClickListener? = null

    protected lateinit var binding: Binding
        private set

    private var progressDialog : ProgressDialog? = null

    protected inline fun <reified T : ClickHandler<in VM>> clickHandler() = clickHandler(T::class)

    protected fun <T : ClickHandler<in VM>> clickHandler(clazz: KClass<T>) = lazy {
        getKoin().get<T>(clazz, null) {
            parametersOf(dialog, viewModel, fragmentManager)
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = DataBindingUtil.inflate(inflater, layoutId, container, false)
        binding.setVariable(BR.viewModel, viewModel)
        binding.setVariable(BR.clickHandler, clickHandler)
        binding.lifecycleOwner = this

        setStyle(STYLE_NO_TITLE, android.R.style.Theme_DeviceDefault_Dialog_MinWidth)
        dialog?.window?.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))

        viewModel.showLoading.observe(this, {
            if (it > 0) {
                Handler(Looper.getMainLooper()).post {
                    context?.let {
                        if (progressDialog == null) {
                            progressDialog = ProgressDialog(it)
                        }
                        progressDialog?.show()
                    }
                }
            } else {
                Handler(Looper.getMainLooper()).postDelayed({
                    if (it == 0) {
                        progressDialog?.dismiss()
                    }
                }, 100)
            }
        })

        return binding.root
    }

    fun onPositiveButtonClicked(view : View) {
        positiveButtonClickListener?.onClick(view)
    }

    fun onNegativeButtonClicked(view : View) {
        negativeButtonClickListener?.onClick(view)
    }

    fun onNeutralButtonClicked(view : View) {
        neutralButtonClickListener?.onClick(view)
    }
}

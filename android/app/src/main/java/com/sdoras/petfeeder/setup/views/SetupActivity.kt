package com.sdoras.petfeeder.setup.views

import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import androidx.lifecycle.Observer
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.core.views.DataBoundActivity
import com.sdoras.petfeeder.databinding.ActivitySetupBinding
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel
import com.sdoras.petfeeder.setup.viewModels.impl.SetupViewModelImpl
import com.sdoras.petfeeder.setup.viewModels.steps.base.SetupStepViewModel
import org.koin.androidx.viewmodel.ext.android.viewModel

class SetupActivity : DataBoundActivity<SetupViewModel, ActivitySetupBinding>(), SetupStepViewModel.Delegate {

    override val layoutId = R.layout.activity_setup
    override val viewModel by viewModel<SetupViewModelImpl>()
    override val clickHandler : ClickHandler<SetupViewModel>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        viewModel.currentStepFragment.observe(this, Observer {
            supportFragmentManager.beginTransaction()
                    .replace(R.id.frame, it)
                    .commit()

            it.viewModel.delegate = this
        })
    }

    override fun onBackPressed() {
        AlertDialog.Builder(this)
                .setTitle(R.string.are_you_sure)
                .setMessage(R.string.setup_cancel_message)
                .setPositiveButton(R.string.yes) { _, _ ->
                    super.onBackPressed()
                }.setNegativeButton(R.string.no) { _, _ ->

                }.show()
    }

    override fun goToNextStep(bundle: Bundle?) {
        viewModel.onNext(bundle)
    }
}

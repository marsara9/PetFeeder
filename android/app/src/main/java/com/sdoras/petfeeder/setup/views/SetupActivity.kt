package com.sdoras.petfeeder.setup.views

import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.core.views.DataBoundActivity
import com.sdoras.petfeeder.databinding.ActivitySetupBinding
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel
import com.sdoras.petfeeder.setup.viewModels.SetupViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class SetupActivity : DataBoundActivity<SetupViewModel, ActivitySetupBinding>() {

    override val layoutId = R.layout.activity_setup
    override val viewModel by viewModel<SetupViewModelImpl>()
    override val clickHandler by clickHandler<SetupClickHandler>()
}

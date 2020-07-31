package com.sdoras.petfeeder.setup.views

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel
import com.sdoras.petfeeder.setup.viewModels.SetupViewModelImpl
import org.koin.androidx.viewmodel.ext.android.viewModel

class SetupActivity : AppCompatActivity() {

    private val viewModel by viewModel<SetupViewModelImpl>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_setup)
    }
}

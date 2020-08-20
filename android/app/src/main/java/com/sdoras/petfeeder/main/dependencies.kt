package com.sdoras.petfeeder.main

import com.sdoras.petfeeder.main.viewModels.MainViewModelImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

fun mainModule() = module {
    viewModel { MainViewModelImpl(get()) }
}
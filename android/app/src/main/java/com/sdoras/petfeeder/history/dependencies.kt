package com.sdoras.petfeeder.history

import com.sdoras.petfeeder.history.viewModels.HistoryViewModelImpl
import com.sdoras.petfeeder.history.views.HistoryClickHandler
import com.sdoras.petfeeder.history.views.HistoryClickHandlerImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.module.Module
import org.koin.dsl.module

fun historyModule() : Module {
    return module {
        viewModel { HistoryViewModelImpl(get()) }
        single<HistoryClickHandler> { args -> HistoryClickHandlerImpl(args[0], args[1]) }
    }
}

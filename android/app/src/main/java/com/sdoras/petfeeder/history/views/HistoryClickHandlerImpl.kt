package com.sdoras.petfeeder.history.views

import androidx.fragment.app.FragmentManager
import com.sdoras.petfeeder.history.viewModels.HistoryViewModel

class HistoryClickHandlerImpl(
        override val viewModel: HistoryViewModel,
        override val fragmentManager: FragmentManager
) : HistoryClickHandler {

}

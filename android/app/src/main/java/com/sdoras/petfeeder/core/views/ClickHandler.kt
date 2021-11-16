package com.sdoras.petfeeder.core.views

import androidx.fragment.app.FragmentManager
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface ClickHandler<T : BaseViewModel> {
    val viewModel : T
    val fragmentManager : FragmentManager
}

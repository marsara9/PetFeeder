package com.sdoras.petfeeder.core.views

import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface ClickHandler<T : BaseViewModel> {
    var viewModel : T?
}

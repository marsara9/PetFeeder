package com.sdoras.petfeeder.setup.views

import android.view.View
import com.sdoras.petfeeder.core.views.ClickHandler
import com.sdoras.petfeeder.setup.viewModels.SetupViewModel

interface SetupClickHandler : ClickHandler<SetupViewModel> {

    fun onNext(view : View)

    fun onCancel(view: View)

    fun onBack(view: View)

    fun onDone(view: View)

}
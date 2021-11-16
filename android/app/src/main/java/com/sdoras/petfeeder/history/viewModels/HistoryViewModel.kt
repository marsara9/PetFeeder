package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.LiveData
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.viewModels.BaseViewModel

interface HistoryViewModel : BaseViewModel {

    val history : LiveData<List<HistoryItem>>

    data class HistoryItem(
            val dateString : String,
            val feedings : List<Feeding>
    )
}

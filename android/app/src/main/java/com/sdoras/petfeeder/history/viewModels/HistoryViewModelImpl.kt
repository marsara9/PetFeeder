package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import java.text.SimpleDateFormat
import java.util.*

class HistoryViewModelImpl(
        feedingRepository: FeedingRepository
) : AbstractViewModel(), HistoryViewModel {

    override val history = MutableLiveData<Map<String, List<Feeding>>>()

    init {
        disposables.add(feedingRepository.get()
                .map {
                    it.fold(mutableMapOf<String, List<Feeding>>()) { map, item ->
                        val dateFormat = SimpleDateFormat("EEE, MMM d, yyyy", Locale.getDefault())
                        dateFormat.format(item.date).let { date ->
                            map[date] = (map[date] ?: emptyList()).plus(item)
                        }
                        map
                    }
                }
                .subscribe({
                    history.value = it
                }, {
                    history.value = emptyMap()
                }))
    }
}

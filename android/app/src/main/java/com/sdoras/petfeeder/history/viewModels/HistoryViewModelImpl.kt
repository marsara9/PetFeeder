package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.asLiveData
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import kotlinx.coroutines.flow.map
import java.text.SimpleDateFormat
import java.util.*

class HistoryViewModelImpl(
        feedingRepository: FeedingRepository
) : AbstractViewModel(), HistoryViewModel {

    override val history = feedingRepository.get()
            .map { feedings ->
                feedings.sortedByDescending { it.date }
                        .fold(LinkedHashMap<String, List<Feeding>>()) { map, item ->
                            val dateFormat = SimpleDateFormat("EEE, MMM d, yyyy", Locale.getDefault())
                            dateFormat.format(item.date).let { date ->
                                map[date] = (map[date] ?: emptyList()).plus(item)
                            }
                            map
                        }
            }.map {
                it.map { entry ->
                    HistoryViewModel.HistoryItem(entry.key, entry.value)
                }
            }.asLiveData()

    init {
        feedingRepository.init()
    }
}

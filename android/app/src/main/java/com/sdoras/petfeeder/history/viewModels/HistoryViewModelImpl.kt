package com.sdoras.petfeeder.history.viewModels

import androidx.lifecycle.MutableLiveData
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.core.services.repositories.FeederUrlRepository
import com.sdoras.petfeeder.core.services.repositories.FeedingRepository
import com.sdoras.petfeeder.core.viewModels.AbstractViewModel
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.LinkedHashMap

class HistoryViewModelImpl(
        feedingRepository: FeedingRepository
) : AbstractViewModel(), HistoryViewModel {

    override val history = MutableLiveData<List<HistoryViewModel.HistoryItem>>()

    init {
        disposables.add(feedingRepository.get()
                .map {
                    it.sortedByDescending { it.date }
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
                }.subscribe(history::setValue) {
                    history.value = emptyList()
                })
    }
}

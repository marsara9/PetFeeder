package com.sdoras.petfeeder.history.views

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.core.models.Feeding
import com.sdoras.petfeeder.history.viewModels.HistoryViewModel

class HistoryAdapter(
        history: List<HistoryViewModel.HistoryItem>
) : RecyclerView.Adapter<HistoryAdapter.ViewHolder>() {

    private val items: List<Any>

    init {
        val items = mutableListOf<Any>()
        history.forEach {
            if (!items.contains(it.dateString)) {
                items.add(it.dateString)
            }
            items.addAll(it.feedings)
        }
        this.items = items
    }

    override fun getItemViewType(position: Int): Int {

        return when (items[position]) {
            is String -> R.layout.item_section_header
            else -> R.layout.item_history_feeding
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val binding: ViewDataBinding = DataBindingUtil.inflate(layoutInflater, viewType, parent, false)

        return ViewHolder(binding.root, viewType, binding)
    }

    override fun getItemCount(): Int {
        return items.size
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        when (holder.viewType) {
            R.layout.item_section_header -> holder.binding.setVariable(BR.header, items[position])
            else -> holder.binding.setVariable(BR.feeding, items[position])
        }
    }

    class ViewHolder(
            view: View,
            val viewType: Int,
            val binding: ViewDataBinding
    ) : RecyclerView.ViewHolder(view)
}

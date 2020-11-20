package com.sdoras.petfeeder.schedules.views

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView
import com.sdoras.petfeeder.BR
import com.sdoras.petfeeder.R
import com.sdoras.petfeeder.schedules.viewModels.SchedulesViewModel

class SchedulesAdapter(
        private val scheduledFeedings: List<SchedulesViewModel.ScheduledItem>
) : RecyclerView.Adapter<SchedulesAdapter.ViewHolder>() {

    override fun getItemViewType(position: Int): Int {
        return if(position < scheduledFeedings.size) {
            R.layout.item_scheduled_feeding
        } else {
            R.layout.item_schedule_add
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val binding: ViewDataBinding = DataBindingUtil.inflate(layoutInflater, viewType, parent, false)

        return ViewHolder(binding.root, viewType, binding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {

        when(holder.viewType) {
            R.layout.item_scheduled_feeding -> {
                holder.binding.setVariable(BR.item, scheduledFeedings[position])
            }
            R.layout.item_schedule_add -> {
                // TODO: Set onClick listener
            }
        }
    }

    override fun getItemCount(): Int {
        return scheduledFeedings.size + 1
    }

    class ViewHolder(
            view: View,
            val viewType: Int,
            val binding: ViewDataBinding
    ) : RecyclerView.ViewHolder(view)
}
package com.sdoras.petfeeder.core.utils

import androidx.lifecycle.LiveData
import androidx.lifecycle.MediatorLiveData

object LiveDataUtils {

    fun <R> combineLatest(
            sources : Iterable<LiveData<*>>,
            combiner : (List<Any>) -> R
    ) : LiveData<R> {

        val mediator = MediatorLiveData<R>()
        val values = mutableMapOf<Int, Any>()

        sources.forEachIndexed { index, source ->
            mediator.addSource(source) { value ->
                values[index] = value
                if(values.size == sources.count()) {
                    mediator.value = combiner(values.toList().sortedBy {
                        it.first
                    }.map {
                        it.second
                    })
                }
            }
        }
        return mediator

    }

    inline fun <reified T1, reified T2, R> combineLatest(
            source1: LiveData<T1>,
            source2 : LiveData<T2>,
            crossinline combiner : (T1, T2) -> R
    ) : LiveData<R> {
        return combineLatest(listOf(source1, source2)) {
            val t1 = it[0] as T1
            val t2 = it[1] as T2

            combiner(t1, t2)
        }
    }

    inline fun <reified T1, reified T2, reified T3, R> combineLatest(
            source1: LiveData<T1>,
            source2 : LiveData<T2>,
            source3 : LiveData<T3>,
            crossinline combiner : (T1, T2, T3) -> R
    ) : LiveData<R> {
        return combineLatest(listOf(source1, source2, source3)) {
            val t1 = it[0] as T1
            val t2 = it[1] as T2
            val t3 = it[1] as T3

            combiner(t1, t2, t3)
        }
    }
}

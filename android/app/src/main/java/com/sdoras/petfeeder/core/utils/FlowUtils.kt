package com.sdoras.petfeeder.core.utils

import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.first

suspend fun <T> StateFlow<T?>.firstNotNull() : T {
    return checkNotNull(filter {
        it != null
    }.first())
}

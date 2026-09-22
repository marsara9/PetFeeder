package com.sdoras.petfeeder.core.feeder

/** Persists which feeder the user wants to interact with. */
class SelectFeederUseCase(private val repository: FeederRepository) {
    suspend operator fun invoke(id: String) = repository.selectFeeder(id)
}

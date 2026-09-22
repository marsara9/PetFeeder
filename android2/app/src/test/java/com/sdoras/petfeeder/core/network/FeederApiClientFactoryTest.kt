package com.sdoras.petfeeder.core.network

import com.sdoras.petfeeder.core.feeder.Feeder
import org.junit.jupiter.api.Assertions.assertNotSame
import org.junit.jupiter.api.Assertions.assertSame
import org.junit.jupiter.api.Test

class FeederApiClientFactoryTest {

    private val factory = FeederApiClientFactory()

    @Test
    fun `returns a cached instance for the same feeder id`() {
        val feeder = Feeder(id = "a", displayName = "Feeder A", host = "http://a.local")

        val first = factory.retrofitFor(feeder)
        val second = factory.retrofitFor(feeder)

        assertSame(first, second)
    }

    @Test
    fun `returns a distinct instance for a different feeder id or host`() {
        val feederA = Feeder(id = "a", displayName = "Feeder A", host = "http://a.local")
        val feederB = Feeder(id = "b", displayName = "Feeder B", host = "http://b.local")

        val clientA = factory.retrofitFor(feederA)
        val clientB = factory.retrofitFor(feederB)

        assertNotSame(clientA, clientB)
    }
}

package com.sdoras.petfeeder.core.network

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

class FeederErrorParserTest {

    @Test
    fun `parses the device error envelope`() {
        val body = """{"error":{"code":503,"message":"Unable to save feeding"}}"""

        val exception = FeederErrorParser.parse(NetworkJson, httpStatusCode = 503, body = body)

        assertEquals(503, exception.code)
        assertEquals("Unable to save feeding", exception.message)
    }

    @Test
    fun `falls back to a generic exception for an unparseable body`() {
        val exception = FeederErrorParser.parse(NetworkJson, httpStatusCode = 503, body = "not json")

        assertEquals(503, exception.code)
    }
}

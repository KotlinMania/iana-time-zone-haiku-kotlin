package io.github.kotlinmania.ianatimezonehaiku

import kotlin.test.Test
import kotlin.test.assertNull

class IanaTimeZoneHaikuTest {
    /**
     * Verifies the non-Haiku platform behavior where [getTimezone] returns null on all supported
     * Kotlin Multiplatform targets.
     */
    @Test
    fun testFallbackOnNonHaikuPlatforms() {
        assertNull(getTimezone())
    }

    // Haiku-native platform timezone lookup test omitted because Kotlin Multiplatform has no Haiku OS target.
}

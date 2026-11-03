// port-lint: tests lib.rs
package io.github.kotlinmania.ianatimezonehaiku

import kotlin.test.Test
import kotlin.test.assertNull

class LibTest {
    /**
     * Mirrors upstream `#[cfg(not(target_os = "haiku"))]
     * fn test_fallback_on_non_haiku_platforms` — every Kotlin
     * Multiplatform target is by definition "not haiku" because
     * Kotlin/Native has no Haiku target, so [getTimezone] must
     * return null.
     */
    @Test
    fun testFallbackOnNonHaikuPlatforms() {
        assertNull(getTimezone())
    }

    // Upstream lib.rs also has `test_retrieve_time_zone_on_haiku_platforms`
    // gated on `#[cfg(target_os = "haiku")]`. Kotlin/Native has no Haiku
    // target, so there is no Kotlin host on which that test can run — it
    // is intentionally not ported.
}

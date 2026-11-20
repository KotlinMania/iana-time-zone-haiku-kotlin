package io.github.kotlinmania.ianatimezonehaiku

/**
 * Returns the current IANA time zone name on Haiku OS, or null when running on any non-Haiku
 * platform or when timezone lookup is unavailable.
 *
 * Kotlin Multiplatform does not target Haiku OS and ships no Haiku sysroot headers, so every
 * supported target mirrors the non-Haiku null fallback.
 */
public fun getTimezone(): String? = null

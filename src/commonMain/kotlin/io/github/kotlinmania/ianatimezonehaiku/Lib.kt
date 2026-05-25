// port-lint: source lib.rs
package io.github.kotlinmania.ianatimezonehaiku

/**
 * Get the current IANA time zone as a string.
 *
 * On Haiku platforms the upstream Rust crate returns [String] with the
 * timezone or null if an error occurs. On all other platforms, null is
 * returned.
 *
 * Kotlin/Native does not target Haiku OS — every Kotlin Multiplatform
 * target (iOS, macOS, tvOS, watchOS, Linux, MinGW, Android Native,
 * Android, JVM, JS, Wasm-JS, Wasm-WASI) is by definition "non-Haiku",
 * so this function always returns null. The implementation mirrors the
 * upstream `#[cfg(not(target_os = "haiku"))]` fallback documented in
 * `tmp/iana-time-zone-haiku/src/lib.rs` line 71.
 *
 * Upstream Rust calls a C++ shim
 * (`iana_time_zone_haiku_get_tz`, defined in `implementation.cc`) that
 * queries Haiku's `BLocaleRoster::Default()->GetLanguage()` API. That
 * native call has no Kotlin/Native equivalent because no Kotlin/Native
 * sysroot ships Haiku headers or `libbe.so`. Translating the C++ shim
 * was therefore not in scope; the Haiku-only call site is replaced
 * with the null fallback.
 */
public fun getTimezone(): String? = null

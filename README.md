# iana-time-zone-haiku-kotlin

[![GitHub link](https://img.shields.io/badge/GitHub-KotlinMania%2Fiana--time--zone--haiku--kotlin-blue.svg)](https://github.com/KotlinMania/iana-time-zone-haiku-kotlin)
[![Maven Central](https://img.shields.io/maven-central/v/io.github.kotlinmania/iana-time-zone-haiku-kotlin)](https://central.sonatype.com/artifact/io.github.kotlinmania/iana-time-zone-haiku-kotlin)

Kotlin Multiplatform port of the
[`iana-time-zone-haiku`](https://github.com/strawlab/iana-time-zone/tree/main/haiku)
Rust crate — the Haiku OS support crate of
[`strawlab/iana-time-zone`](https://github.com/strawlab/iana-time-zone).

## Scope

The upstream crate calls a C++ shim
(`iana_time_zone_haiku_get_tz`, defined in
[`implementation.cc`](tmp/iana-time-zone-haiku/src/implementation.cc))
which queries
`BLocaleRoster::Default()->GetLanguage()` from Haiku's `libbe`.
Kotlin/Native ships no Haiku target and no Haiku sysroot, so the
native call site has no Kotlin/Native equivalent.

The Kotlin port mirrors the upstream API exactly — `getTimezone(): String?`
— and always returns `null` on every Kotlin Multiplatform target, which
is the same behavior the upstream crate exposes under
`#[cfg(not(target_os = "haiku"))]` (see `lib.rs` line 71).

This artifact exists so that downstream Kotlin Multiplatform ports of
`iana-time-zone` (notably
[`iana-time-zone-kotlin`](https://github.com/KotlinMania/iana-time-zone-kotlin))
have a clean Gradle dep to resolve when their `nativeMain` source set
mirrors upstream's `cfg(target_os = "haiku")` target-specific
dependency.

## Install

```kotlin
commonMain.dependencies {
    implementation("io.github.kotlinmania:iana-time-zone-haiku-kotlin:0.1.0")
}
```

## Upstream

- Crate: [`iana-time-zone-haiku`](https://crates.io/crates/iana-time-zone-haiku)
- Source: [`strawlab/iana-time-zone/haiku`](https://github.com/strawlab/iana-time-zone/tree/main/haiku)
- License: MIT OR Apache-2.0

## License

Dual-licensed under the MIT license and the Apache License, Version 2.0,
matching the upstream crate.

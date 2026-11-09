// This suite covers the non-Haiku fallback and nullable Swift bridge only.
// Kotlin/Native has no Haiku target, so it does not test timezone discovery.
#if canImport(Testing)
import Testing
import IanaTimeZoneHaiku

@Suite("Non-Haiku Nullable Bridge Tests")
struct NonHaikuNullableBridgeTests {
    @Test("Repeated fallback calls bridge to nil")
    func testRepeatedNullableFallback() {
        for _ in 0..<3 {
            let timezone: String? = IanaTimeZoneHaiku.getTimezone()
            #expect(timezone == nil)
        }
    }
}
#elseif canImport(XCTest)
import XCTest
import IanaTimeZoneHaiku

final class NonHaikuNullableBridgeTests: XCTestCase {
    func testRepeatedNullableFallback() {
        for _ in 0..<3 {
            let timezone: String? = IanaTimeZoneHaiku.getTimezone()
            XCTAssertNil(timezone)
        }
    }
}
#endif

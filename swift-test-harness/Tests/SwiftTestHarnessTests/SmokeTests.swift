#if canImport(Testing)
import Testing
import IanaTimeZoneHaiku

@Suite("IanaTimeZoneHaiku Swift Export Tests")
struct SmokeTests {
    @Test("Fallback on non-Haiku platforms")
    func testFallbackOnNonHaiku() {
        #expect(IanaTimeZoneHaiku.getTimezone() == nil)
    }
}
#elseif canImport(XCTest)
import XCTest
import IanaTimeZoneHaiku

final class SmokeTests: XCTestCase {
    func testFallbackOnNonHaiku() throws {
        XCTAssertNil(IanaTimeZoneHaiku.getTimezone())
    }
}
#endif

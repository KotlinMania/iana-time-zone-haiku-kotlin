import Testing
import IanaTimeZoneHaiku

@Suite("IanaTimeZoneHaiku Swift Export Tests")
struct SmokeTests {
    @Test("Fallback on non-Haiku platforms")
    func testFallbackOnNonHaiku() {
        #expect(IanaTimeZoneHaiku.getTimezone() == nil)
    }

    @Test("Repeated fallback calls bridge cleanly to nil")
    func testRepeatedNullableFallback() {
        for _ in 0..<3 {
            let timezone: String? = IanaTimeZoneHaiku.getTimezone()
            #expect(timezone == nil)
        }
    }
}

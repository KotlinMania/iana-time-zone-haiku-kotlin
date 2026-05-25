import XCTest
import IanaTimeZoneHaikuLibrary

final class SmokeTests: XCTestCase {
    /// On any Apple platform Kotlin/Native targets (none of which are Haiku),
    /// `getTimezone()` must always return nil. This mirrors the upstream
    /// `#[cfg(not(target_os = "haiku"))]` fallback test.
    func testFallbackOnNonHaiku() throws {
        XCTAssertNil(IanaTimeZoneHaiku.getTimezone())
    }
}

import XCTest
@testable import Device

final class DeviceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(Device.version(), "Version is not nil")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

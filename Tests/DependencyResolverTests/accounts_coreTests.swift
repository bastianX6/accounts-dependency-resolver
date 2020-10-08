import XCTest
@testable import accounts_core

final class accounts_coreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(accounts_core().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

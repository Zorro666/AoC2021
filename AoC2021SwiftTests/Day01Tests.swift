import XCTest
@testable import AoC2021Swift

class Day01Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountWindow1() throws {
      let values = [
 199,
 200,
 208,
 210,
 200,
 207,
 240,
 269,
 260,
 263]
      let window = 1
      let expected = 7
      XCTAssertEqual(expected, Day01.CountWindow(values: values, window: window))
    }

    func testCountWindow3() throws {
      let values = [
 199,
 200,
 208,
 210,
 200,
 207,
 240,
 269,
 260,
 263]
      let window = 3
      let expected = 5
      XCTAssertEqual(expected, Day01.CountWindow(values: values, window: window))
    }
}

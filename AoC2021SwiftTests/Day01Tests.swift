import XCTest
@testable import AoC2021Swift

class Day01Tests: XCTestCase {
  
    func testCountWindow1() throws {
      let testInput = [
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
      let result = Day01.CountWindow(values: testInput, window: window)
      XCTAssertEqual(expected, result)
    }

    func testCountWindow3() throws {
      let testInput = [
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
      let result = Day01.CountWindow(values: testInput, window: window)
      XCTAssertEqual(expected, result)
    }
}

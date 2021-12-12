import XCTest
@testable import AoC2021Swift

class Day01Tests: XCTestCase {

  let day:Day01 = Day01()
  let input = """
199
200
208
210
200
207
240
269
260
263
"""

  var vals:[Int] = []

  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    vals = day.Parse(lines: lines)
  }

  func testCountWindow1() throws {
    let window = 1
    let expected = 7
    let result = day.CountWindow(values: vals, window: window)
    XCTAssertEqual(expected, result)
  }
  
  func testCountWindow3() throws {
    let window = 3
    let expected = 5
    let result = day.CountWindow(values: vals, window: window)
    XCTAssertEqual(expected, result)
  }
}

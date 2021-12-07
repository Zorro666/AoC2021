import XCTest
@testable import AoC2021Swift

class Day01Tests: XCTestCase {
  
  static let input = """
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

  static var vals:[Int] = []

  override class func setUp() {
    let lines = Day01Tests.input.components(separatedBy: ["\n"])
    Day01Tests.vals = Day01.Parse(lines: lines)
  }

  func testCountWindow1() throws {
    let window = 1
    let expected = 7
    let result = Day01.CountWindow(values: Day01Tests.vals, window: window)
    XCTAssertEqual(expected, result)
  }
  
  func testCountWindow3() throws {
    let window = 3
    let expected = 5
    let result = Day01.CountWindow(values: Day01Tests.vals, window: window)
    XCTAssertEqual(expected, result)
  }
}

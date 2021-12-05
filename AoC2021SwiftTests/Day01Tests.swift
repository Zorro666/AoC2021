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
  
  func testCountWindow1() throws {
    let lines = Day01Tests.input.components(separatedBy: ["\n"])
    let vals = Day01.Parse(lines: lines)
    let window = 1
    let expected = 7
    let result = Day01.CountWindow(values: vals, window: window)
    XCTAssertEqual(expected, result)
  }
  
  func testCountWindow3() throws {
    let lines = Day01Tests.input.components(separatedBy: ["\n"])
    let vals = Day01.Parse(lines: lines)
    let window = 3
    let expected = 5
    let result = Day01.CountWindow(values: vals, window: window)
    XCTAssertEqual(expected, result)
  }
}

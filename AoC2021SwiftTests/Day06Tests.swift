import XCTest
@testable import AoC2021Swift

class Day06Tests: XCTestCase {
  
  static let input = """
3,4,3,1,2
"""
  func testPart1_18_26() throws {
    let lines = Day06Tests.input.components(separatedBy: ["\n"])
    let expected = 26
    Day06.Parse(lines: lines)
    let actual = Day06.Simulate(days: 18)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_80_5934() throws {
    let lines = Day06Tests.input.components(separatedBy: ["\n"])
    let expected = 5934
    Day06.Parse(lines: lines)
    let actual = Day06.Simulate(days: 80)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let lines = Day06Tests.input.components(separatedBy: ["\n"])
    let expected = 26984457539
    Day06.Parse(lines: lines)
    let actual = Day06.Simulate(days: 256)
    XCTAssertEqual(expected, actual)
  }
}

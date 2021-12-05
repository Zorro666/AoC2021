import XCTest
@testable import AoC2021Swift

class Day10Tests: XCTestCase {
  
  static let input = """
"""
  func testPart1() throws {
    let lines = Day10Tests.input.components(separatedBy: ["\n"])
    let expected = 5
    let actual = Day10.Part1(lines: lines)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let lines = Day10Tests.input.components(separatedBy: ["\n"])
    let expected = 12
    let actual = Day10.Part2(lines: lines)
    XCTAssertEqual(expected, actual)
  }
}

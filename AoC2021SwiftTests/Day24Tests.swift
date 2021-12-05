import XCTest
@testable import AoC2021Swift

class Day24Tests: XCTestCase {

  static let input = """
"""
  func testPart1() throws {
    let lines = Day24Tests.input.components(separatedBy: ["\n"])
    let expected = 5
    let actual = Day24.Part1(lines: lines)
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let lines = Day24Tests.input.components(separatedBy: ["\n"])
    let expected = 12
    let actual = Day24.Part2(lines: lines)
    XCTAssertEqual(expected, actual)
  }
}

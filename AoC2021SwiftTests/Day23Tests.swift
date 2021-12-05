import XCTest
@testable import AoC2021Swift

class Day23Tests: XCTestCase {

  static let input = """
"""
  func testPart1() throws {
    let lines = Day23Tests.input.components(separatedBy: ["\n"])
    let expected = 5
    let actual = Day23.Part1(lines: lines)
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let lines = Day23Tests.input.components(separatedBy: ["\n"])
    let expected = 12
    let actual = Day23.Part2(lines: lines)
    XCTAssertEqual(expected, actual)
  }
}

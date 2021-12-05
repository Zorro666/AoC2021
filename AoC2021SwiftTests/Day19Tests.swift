import XCTest
@testable import AoC2021Swift

class Day19Tests: XCTestCase {

  static let input = """
"""
  func testPart1() throws {
    let lines = Day19Tests.input.components(separatedBy: ["\n"])
    let expected = 5
    let actual = Day19.Part1(lines: lines)
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let lines = Day19Tests.input.components(separatedBy: ["\n"])
    let expected = 12
    let actual = Day19.Part2(lines: lines)
    XCTAssertEqual(expected, actual)
  }
}

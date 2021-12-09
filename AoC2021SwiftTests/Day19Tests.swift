import XCTest
@testable import AoC2021Swift

class Day19Tests: XCTestCase {

  static let input = """
"""

  override class func setUp() {
    let lines = self.input.components(separatedBy: ["\n"])
    Day19.Parse(lines: lines)
  }

  func testPart1() throws {
    let expected = 5
    let actual = Day19.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let expected = 12
    let actual = Day19.Part2()
    XCTAssertEqual(expected, actual)
  }
}

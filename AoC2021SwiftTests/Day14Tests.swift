import XCTest
@testable import AoC2021Swift

class Day14Tests: XCTestCase {

  static let input = """
"""

  override class func setUp() {
    let lines = self.input.components(separatedBy: ["\n"])
    Day14.Parse(lines: lines)
  }

  func testPart1() throws {
    let expected = 5
    let actual = Day14.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let expected = 12
    let actual = Day14.Part2()
    XCTAssertEqual(expected, actual)
  }
}

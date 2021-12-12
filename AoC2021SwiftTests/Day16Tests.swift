import XCTest
@testable import AoC2021Swift

class Day16Tests: XCTestCase {

  let day:Day16 = Day16()
  let input = """
"""

  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }

  func testPart1() throws {
    let expected = 5
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let expected = 12
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

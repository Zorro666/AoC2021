import XCTest
@testable import AoC2021Swift

class Day23Tests: XCTestCase {

  let day:Day23 = Day23()
  let input = """
#############
#...........#
###B#C#B#D###
  #A#D#C#A#
  #########
"""

  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }

  func testPart1() throws {
    let expected = 12521
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let expected = 44169
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

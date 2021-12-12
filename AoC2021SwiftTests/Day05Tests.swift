import XCTest
@testable import AoC2021Swift

class Day05Tests: XCTestCase {

  let day:Day05 = Day05()
  let input = """
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
"""

  var lines:[String] = []

  override func setUp() {
    lines = input.components(separatedBy: ["\n"])
  }

  func testPart1() throws {
    let actual = day.Part1(lines: lines)
    let expected = 5
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let actual = day.Part2(lines: lines)
    let expected = 12
    XCTAssertEqual(expected, actual)
  }
}

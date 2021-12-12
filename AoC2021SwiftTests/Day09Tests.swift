import XCTest
@testable import AoC2021Swift

class Day09Tests: XCTestCase {

  let day:Day09 = Day09()
  let input = """
2199943210
3987894921
9856789892
8767896789
9899965678
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 15
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 1134
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

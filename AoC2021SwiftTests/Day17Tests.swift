import XCTest
@testable import AoC2021Swift

class Day17Tests: XCTestCase {
  
  let day:Day17 = Day17()
  let input = """
target area: x=20..30, y=-10..-5
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 45
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 112
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

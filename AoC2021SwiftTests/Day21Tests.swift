import XCTest
@testable import AoC2021Swift

class Day21Tests: XCTestCase {
  
  let day:Day21 = Day21()
  let input = """
Player 1 starting position: 4
Player 2 starting position: 8
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 739785
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 444356092776315
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

import XCTest
@testable import AoC2021Swift

class Day11Tests: XCTestCase {

  let day:Day11 = Day11()
  let input = """
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1_10() throws {
    let expected = 204
    let actual = day.Part1(steps:10)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_100() throws {
    let expected = 1656
    let actual = day.Part1(steps:100)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 195
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

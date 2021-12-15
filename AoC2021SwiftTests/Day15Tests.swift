import XCTest
@testable import AoC2021Swift

class Day15Tests: XCTestCase {
  
  let day:Day15 = Day15()
  let input = """
1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581
"""
  
  override func setUp() {
    let lines = self.input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 40
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 315
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

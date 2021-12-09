import XCTest
@testable import AoC2021Swift

class Day09Tests: XCTestCase {
  
  static let input = """
2199943210
3987894921
9856789892
8767896789
9899965678
"""
  
  override class func setUp() {
    let lines = self.input.components(separatedBy: ["\n"])
    Day09.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 15
    let actual = Day09.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 1134
    let actual = Day09.Part2()
    XCTAssertEqual(expected, actual)
  }
}

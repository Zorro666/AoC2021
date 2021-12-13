import XCTest
@testable import AoC2021Swift

class Day13Tests: XCTestCase {
  
  let day:Day13 = Day13()
  let input = """
6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 17
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expectedStrings = """
#####
#...#
#...#
#...#
#####
"""
    let expected = expectedStrings.components(separatedBy: ["\n"])
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

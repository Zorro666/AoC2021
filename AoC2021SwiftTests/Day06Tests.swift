import XCTest
@testable import AoC2021Swift

class Day06Tests: XCTestCase {

  let day:Day06 = Day06()
  let input = """
3,4,3,1,2
"""

  var lines:[String] = []

  override func setUp() {
    lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }

  func testPart1_18_26() throws {
    let expected = 26
    let actual = day.Simulate(days: 18)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_80_5934() throws {
    let expected = 5934
    let actual = day.Simulate(days: 80)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 26984457539
    let actual = day.Simulate(days: 256)
    XCTAssertEqual(expected, actual)
  }
}

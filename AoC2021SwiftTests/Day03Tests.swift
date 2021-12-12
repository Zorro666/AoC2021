import XCTest
@testable import AoC2021Swift

class Day03Tests: XCTestCase {

  let day:Day03 = Day03()
  let input = """
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"""

  var lines:[String] = []

  override func setUp() {
    lines = input.components(separatedBy: ["\n"])
  }

  func testPower() throws {
    let expected = 198
    let actual = day.Power(lines:lines)
    XCTAssertEqual(expected, actual)
  }
  
  func testLifeSupport() throws {
    let expected = 230
    let actual = day.LifeSupport(lines:lines)
    XCTAssertEqual(expected, actual)
  }
}

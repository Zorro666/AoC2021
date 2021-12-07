import XCTest
@testable import AoC2021Swift

class Day03Tests: XCTestCase {
  
  static let input = """
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

  static var lines:[String] = []

  override class func setUp() {
    Day03Tests.lines = Day03Tests.input.components(separatedBy: ["\n"])
  }

  func testPower() throws {
    let expected = 198
    let actual = Day03.Power(lines:Day03Tests.lines)
    XCTAssertEqual(expected, actual)
  }
  
  func testLifeSupport() throws {
    let expected = 230
    let actual = Day03.LifeSupport(lines:Day03Tests.lines)
    XCTAssertEqual(expected, actual)
  }
}

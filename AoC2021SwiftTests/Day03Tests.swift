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
  func testPower() throws {
    let lines = Day03Tests.input.components(separatedBy: ["\n"])
    let expected = 198
    let actual = Day03.Power(lines:lines)
    XCTAssertEqual(expected, actual)
  }
  
  func testLifeSupport() throws {
    let lines = Day03Tests.input.components(separatedBy: ["\n"])
    let expected = 230
    let actual = Day03.LifeSupport(lines:lines)
    XCTAssertEqual(expected, actual)
  }
}

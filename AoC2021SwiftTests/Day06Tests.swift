import XCTest
@testable import AoC2021Swift

class Day06Tests: XCTestCase {
  
  static let input = """
3,4,3,1,2
"""

  static var lines:[String] = []

  override class func setUp() {
    Day06Tests.lines = Day06Tests.input.components(separatedBy: ["\n"])
  }

  override func setUp() {
    Day06.Parse(lines: Day06Tests.lines)
  }

  func testPart1_18_26() throws {
    let expected = 26
    let actual = Day06.Simulate(days: 18)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_80_5934() throws {
    let expected = 5934
    let actual = Day06.Simulate(days: 80)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 26984457539
    let actual = Day06.Simulate(days: 256)
    XCTAssertEqual(expected, actual)
  }
}

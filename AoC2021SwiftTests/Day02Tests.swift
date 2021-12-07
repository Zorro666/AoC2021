import XCTest
@testable import AoC2021Swift

class Day02Tests: XCTestCase {
  
  static let input = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""

  static var lines:[String] = []

  override class func setUp() {
    Day02Tests.lines = Day02Tests.input.components(separatedBy: ["\n"])
  }
  func testMoveSub() throws {
    let expected = 150
    let result = Day02.MoveSub(moves:Day02Tests.lines)
    XCTAssertEqual(expected, result)
  }
  
  func testMoveSub2() throws {
    let expected = 900
    let result = Day02.MoveSub2(moves:Day02Tests.lines)
    XCTAssertEqual(expected, result)
  }
}

import XCTest
@testable import AoC2021Swift

class Day02Tests: XCTestCase {
  
  let day:Day02 = Day02()
  let input = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""

  var lines:[String] = []

  override func setUp() {
    lines = input.components(separatedBy: ["\n"])
  }
  
  func testMoveSub() throws {
    let expected = 150
    let result = day.MoveSub(moves:lines)
    XCTAssertEqual(expected, result)
  }
  
  func testMoveSub2() throws {
    let expected = 900
    let result = day.MoveSub2(moves:lines)
    XCTAssertEqual(expected, result)
  }
}

import XCTest
@testable import AoC2021Swift

class Day02Tests: XCTestCase {
  
    func testMoveSub() throws {
      let testInput = [
"forward 5",
"down 5",
"forward 8",
"up 3",
"down 8",
"forward 2"
 ]
      let expected = 150
      let result = Day02.MoveSub(moves:testInput)
      XCTAssertEqual(expected, result)
    }
  
    func testMoveSub2() throws {
      let testInput = [
"forward 5",
"down 5",
"forward 8",
"up 3",
"down 8",
"forward 2"
 ]
      let expected = 900
      let result = Day02.MoveSub2(moves:testInput)
      XCTAssertEqual(expected, result)
    }
}

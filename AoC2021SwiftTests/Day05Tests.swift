import XCTest
@testable import AoC2021Swift

class Day05Tests: XCTestCase {

    func testPart1() throws {
      let testInput:[String] = [
"0,9 -> 5,9",
"8,0 -> 0,8",
"9,4 -> 3,4",
"2,2 -> 2,1",
"7,0 -> 7,4",
"6,4 -> 2,0",
"0,9 -> 2,9",
"3,4 -> 1,4",
"0,0 -> 8,8",
"5,5 -> 8,2"]
      let expected = 5
      let actual = Day05.Part1(lines: testInput)
      XCTAssertEqual(expected, actual)
    }

    func testPart2() throws {
      let testInput:[String] = [
"0,9 -> 5,9",
"8,0 -> 0,8",
"9,4 -> 3,4",
"2,2 -> 2,1",
"7,0 -> 7,4",
"6,4 -> 2,0",
"0,9 -> 2,9",
"3,4 -> 1,4",
"0,0 -> 8,8",
"5,5 -> 8,2"]
      let expected = 12
      let actual = Day05.Part2(lines: testInput)
      XCTAssertEqual(expected, actual)
    }
}

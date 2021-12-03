import XCTest
@testable import AoC2021Swift

class Day03Tests: XCTestCase {

    func testPower() throws {
      let testInput = [
"00100",
"11110",
"10110",
"10111",
"10101",
"01111",
"00111",
"11100",
"10000",
"11001",
"00010",
"01010"
      ]
      let expected = 198
      let actual = Day03.Power(lines:testInput)
      XCTAssertEqual(expected, actual)
    }

    func testLifeSupport() throws {
      let testInput = [
"00100",
"11110",
"10110",
"10111",
"10101",
"01111",
"00111",
"11100",
"10000",
"11001",
"00010",
"01010"
      ]
      let expected = 230
      let actual = Day03.LifeSupport(lines:testInput)
      XCTAssertEqual(expected, actual)
    }
}

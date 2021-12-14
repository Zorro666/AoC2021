import XCTest
@testable import AoC2021Swift

class Day14Tests: XCTestCase {

  let day:Day14 = Day14()
  let input = """
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
"""

  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }

  func testPart1() throws {
    let expected = 1588
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let expected = 2188189693529
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

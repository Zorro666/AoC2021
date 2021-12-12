import XCTest
@testable import AoC2021Swift

class Day10Tests: XCTestCase {

  let day:Day10 = Day10()
  let input = """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testPart1() throws {
    let expected = 26397
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 288957
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

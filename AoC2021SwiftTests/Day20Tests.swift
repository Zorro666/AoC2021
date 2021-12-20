import XCTest
@testable import AoC2021Swift

class Day20Tests: XCTestCase {

  let day:Day20 = Day20()
  let input = """
..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..###..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#..#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#......#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.....####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.......##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#

#..#.
#....
##..#
..#..
..###
"""

  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }

  func testPart1() throws {
    let expected = 35
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2() throws {
    let expected = 3351
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

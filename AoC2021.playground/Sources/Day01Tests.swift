import XCTest

class Day01Tests : XCTestCase
{
  func Part1()
  {
    let vals: [Int] = [
 199,
 200,
 208,
 210,
 200,
 207,
 240,
 269,
 260,
 263]
    let expected = 3
    let result = Day01.CountWindow(values: vals, window: 1)
    XCTAssertEqual(expected, result)
  }
}

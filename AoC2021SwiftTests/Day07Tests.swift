import XCTest
@testable import AoC2021Swift

class Day07Tests: XCTestCase {

  let day:Day07 = Day07()
  let input = """
16,1,2,0,4,2,7,1,2,14
"""
  
  override func setUp() {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
  }
  
  func testFuel_1_41() throws {
    let position = 1
    let expected = 41
    let actual = day.FuelCost(position:position)
    XCTAssertEqual(expected, actual)
  }
  
  func testFuel_2_37() throws {
    let position = 2
    let expected = 37
    let actual = day.FuelCost(position:position)
    XCTAssertEqual(expected, actual)
  }
  
  func testFuel_3_39() throws {
    let position = 3
    let expected = 39
    let actual = day.FuelCost(position:position)
    XCTAssertEqual(expected, actual)
  }
  
  func testFuel_10_71() throws {
    let position = 10
    let expected = 71
    let actual = day.FuelCost(position:position)
    XCTAssertEqual(expected, actual)
  }
  
  func testMinPosition() throws {
    let expected = 2
    let actual = day.MinPosition()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1() throws {
    let expected = 37
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  func testFuel2_2_206() throws {
    let position = 2
    let expected = 206
    let actual = day.FuelCost2(position:position)
    XCTAssertEqual(expected, actual)
  }
  
  func testFuel2_5_168() throws {
    let position = 5
    let expected = 168
    let actual = day.FuelCost2(position:position)
    XCTAssertEqual(expected, actual)
  }
  
  func testMinPosition2() throws {
    let expected = 5
    let actual = day.MinPosition2()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2() throws {
    let expected = 168
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

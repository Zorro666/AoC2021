import XCTest
@testable import AoC2021Swift

class Day16Tests: XCTestCase {

  let day:Day16 = Day16()
  let input1_1 = """
8A004A801A8002F478
"""
  let input1_2 = """
620080001611562C8802118E34
"""
  let input1_3 = """
C0015000016115A2E0802F182340
"""
  let input1_4 = """
A0016C880162017C3686B18A3D4780
"""
  let input1_5 = """
D2FE28
"""
  let input1_6 = """
38006F45291200
"""

  let input1_7 = """
EE00D40C823060
"""

  let input2_1 = """
C200B40A82
"""

  let input2_2 = """
04005AC33890
"""

  let input2_3 = """
880086C3E88112
"""

  let input2_4 = """
CE00C43D881120
"""

  let input2_5 = """
D8005AC2A8F0
"""

  let input2_6 = """
F600BC2D8F
"""

  let input2_7 = """
9C005AC2F8F0
"""

  let input2_8 = """
9C0141080250320F1802104A08
"""

  func testPart1_1() throws {
    let lines = input1_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 16
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2() throws {
    let lines = input1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 12
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_3() throws {
    let lines = input1_3.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 23
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_4() throws {
    let lines = input1_4.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 31
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_5() throws {
    let lines = input1_5.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 6
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_6() throws {
    let lines = input1_6.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 9
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_7() throws {
    let lines = input1_7.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 14
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_1() throws {
    let lines = input2_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 3
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_2() throws {
    let lines = input2_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 54
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_3() throws {
    let lines = input2_3.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 7
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_4() throws {
    let lines = input2_4.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 9
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_5() throws {
    let lines = input2_5.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 1
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_6() throws {
    let lines = input2_6.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 0
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_7() throws {
    let lines = input2_7.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 0
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }

  func testPart2_8() throws {
    let lines = input2_8.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 1
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

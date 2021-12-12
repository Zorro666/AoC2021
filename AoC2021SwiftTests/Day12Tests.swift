import XCTest
@testable import AoC2021Swift

class Day12Tests: XCTestCase {

  let day:Day12 = Day12()
  let input1 = """
start-A
start-b
A-c
A-b
b-d
A-end
b-end
"""
  
  let input2 = """
dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
"""
  
  let input3 = """
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
"""
  
  var lines1:[String] = []
  var lines2:[String] = []
  var lines3:[String] = []
  
  override func setUp() {
    lines1 = input1.components(separatedBy: ["\n"])
    lines2 = input2.components(separatedBy: ["\n"])
    lines3 = input3.components(separatedBy: ["\n"])
  }
  
  func testPart1_1() throws {
    let expected = 10
    let actual = day.Part1(lines:lines1)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_2() throws {
    let expected = 19
    let actual = day.Part1(lines:lines2)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_3() throws {
    let expected = 226
    let actual = day.Part1(lines:lines3)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2_1() throws {
    let expected = 36
    let actual = day.Part2(lines:lines1)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2_2() throws {
    let expected = 103
    let actual = day.Part2(lines:lines2)
    XCTAssertEqual(expected, actual)
  }
  
  func testPart2_3() throws {
    let expected = 3509
    let actual = day.Part2(lines:lines3)
    XCTAssertEqual(expected, actual)
  }
}

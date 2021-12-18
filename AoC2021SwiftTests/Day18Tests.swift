import XCTest
@testable import AoC2021Swift

class Day18Tests: XCTestCase {
  
  let day:Day18 = Day18()
  let input = """
[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
"""
  
  let explode_1 = """
[[[[[9,8],1],2],3],4]
"""
  
  let explode_2 = """
[7,[6,[5,[4,[3,2]]]]]
"""
  
  let explode_3 = """
[[6,[5,[4,[3,2]]]],1]
"""
  
  let explode_4 = """
[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]
"""
  
  let reduce_1 = """
[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
"""
  
  let sum_1 = """
[1,1]
[2,2]
[3,3]
[4,4]
"""
  
  let sum_2 = """
[1,1]
[2,2]
[3,3]
[4,4]
[5,5]
"""
  
  let sum_3 = """
[1,1]
[2,2]
[3,3]
[4,4]
[5,5]
[6,6]
"""
  
  let sum_4 = """
[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
[7,[5,[[3,8],[1,4]]]]
[[2,[2,2]],[8,[8,1]]]
[2,9]
[1,[[[9,3],9],[[9,0],[0,7]]]]
[[[5,[7,4]],7],1]
[[[[4,2],2],6],[8,7]]
"""
  
  let mag_1 = """
[[1,2],[[3,4],5]]
"""
  
  let mag_2 = """
[[[[0,7],4],[[7,8],[6,0]]],[8,1]]
"""
  
  let mag_3 = """
[[[[1,1],[2,2]],[3,3]],[4,4]]
"""
  
  let mag_4 = """
[[[[3,0],[5,3]],[4,4]],[5,5]]
"""
  
  let mag_5 = """
[[[[5,0],[7,4]],[5,5]],[6,6]]
"""
  
  let mag_6 = """
[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]
"""
  
  let mag_7 = """
[9,1]
"""
  
  let mag_8 = """
[[9,1],[1,9]]
"""
  
  func testMag_1() throws {
    let lines = mag_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 143
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_2() throws {
    let lines = mag_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 1384
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_3() throws {
    let lines = mag_3.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 445
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_4() throws {
    let lines = mag_4.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 791
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_5() throws {
    let lines = mag_5.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 1137
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_6() throws {
    let lines = mag_6.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 3488
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_7() throws {
    let lines = mag_7.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 29
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testMag_8() throws {
    let lines = mag_8.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 129
    let actual = day.Magnitude();
    XCTAssertEqual(expected, actual)
  }
  
  func testExplode_1() throws {
    let lines = explode_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    day.Reduce()
    let expected = "[[[[0,9],2],3],4]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testExplode_2() throws {
    let lines = explode_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    day.Reduce()
    let expected = "[7,[6,[5,[7,0]]]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testExplode_3() throws {
    let lines = explode_3.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    day.Reduce()
    let expected = "[[6,[5,[7,0]]],3]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testExplode_4() throws {
    let lines = explode_4.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    day.Reduce()
    let expected = "[[3,[2,[8,0]]],[9,[5,[7,0]]]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testReduce_1() throws {
    let lines = reduce_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    day.Reduce()
    let expected = "[[[[0,7],4],[[7,8],[6,0]]],[8,1]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testSum_1() throws {
    let lines = sum_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    _ = day.Part1()
    let expected = "[[[[1,1],[2,2]],[3,3]],[4,4]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testSum_2() throws {
    let lines = sum_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    _ = day.Part1()
    let expected = "[[[[3,0],[5,3]],[4,4]],[5,5]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testSum_3() throws {
    let lines = sum_3.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    _ = day.Part1()
    let expected = "[[[[5,0],[7,4]],[5,5]],[6,6]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testSum_4() throws {
    let lines = sum_4.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    _ = day.Part1()
    let expected = "[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1_Sum() throws {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    _ = day.Part1()
    let expected = "[[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]"
    let actual = day.GetString()
    XCTAssertEqual(expected, actual)
  }
  
  func testPart1() throws {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 4140
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
  
  
  func testPart2() throws {
    let lines = input.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 3993
    let actual = day.Part2()
    XCTAssertEqual(expected, actual)
  }
}

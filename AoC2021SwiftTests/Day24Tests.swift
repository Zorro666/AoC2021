import XCTest
@testable import AoC2021Swift

class Day24Tests: XCTestCase {

  let day:Day24 = Day24()
  let input_1_1 = """
inp x
mul x -1
"""

  let input_1_2 = """
inp z
inp x
mul z 3
eql z x
"""

  let input_1_3 = """
inp w
add z w
mod z 2
div w 2
add y w
mod y 2
div w 2
add x w
mod x 2
div w 2
mod w 2
"""

  func testPart1_1() throws {
    let lines = input_1_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let inputs = [Int](repeating: 10, count: 1)
    let expected = -inputs[0]
    _ = day.RunProgram(inputs: inputs)
    let actual = day.registers[day.REGISTER_X]
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    var inputs = [Int](repeating: 0, count: 2)
    inputs[0] = 2
    inputs[1] = 6
    var expected = inputs[1] == 3 * inputs[0] ? 1 : 0
    var actual = day.RunProgram(inputs: inputs)
    XCTAssertEqual(expected, actual)

    inputs[0] = 2
    inputs[1] = 7
    expected = inputs[1] == 3 * inputs[0] ? 1 : 0
    actual = day.RunProgram(inputs: inputs)
    XCTAssertEqual(expected, actual)
  }

  func testPart1_3() throws {
    let lines = input_1_3.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    var inputs = [Int](repeating: 0, count: 2)
    for i in 0...15 {
      inputs[0] = i
      let expectedW = i >> 3 & 0x1
      let expectedX = i >> 2 & 0x1
      let expectedY = i >> 1 & 0x1
      let expectedZ = i >> 0 & 0x1
      let actualZ = day.RunProgram(inputs: inputs)
      XCTAssertEqual(expectedZ, actualZ)
      let actualX = day.registers[day.REGISTER_X]
      XCTAssertEqual(expectedX, actualX)
      let actualY = day.registers[day.REGISTER_Y]
      XCTAssertEqual(expectedY, actualY)
      let actualW = day.registers[day.REGISTER_W]
      XCTAssertEqual(expectedW, actualW)
    }
  }
}

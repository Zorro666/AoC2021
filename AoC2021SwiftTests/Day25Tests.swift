import XCTest
@testable import AoC2021Swift

class Day25Tests: XCTestCase {

  let day:Day25 = Day25()
  let input_1_1 = """
...>...
.......
......>
v.....>
......>
.......
..vvv..
"""

  let input_1_2 = """
v...>>.vv>
.vv>>.vv..
>>.>v>...v
>>v>>.>.v.
v>v.vv.v..
>.>>..v...
.vv..>.>v.
v.v..>>v.v
....v..v.>
"""

  func testPart1_1_1() throws {
    let lines = input_1_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 1
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..vv>..
.......
>......
v.....>
>......
.......
....v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_1_2() throws {
    let lines = input_1_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 2
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
....v>.
..vv...
.>.....
......>
v>.....
.......
.......
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_1_3() throws {
    let lines = input_1_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 3
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
......>
..v.v..
..>v...
>......
..>....
v......
.......
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_1_4() throws {
    let lines = input_1_1.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 4
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
>......
..v....
..>.v..
.>.v...
...>...
.......
v......
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_1() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 1
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
....>.>v.>
v.v>.>v.v.
>v>>..>v..
>>v>v>.>.v
.>v.v...v.
v>>.>vvv..
..v...>>..
vv...>>vv.
>.v.v..v.v
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_2() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 2
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
>.v.v>>..v
v.v.>>vv..
>v>.>.>.v.
>>v>v.>v>.
.>..v....v
.>v>>.v.v.
v....v>v>.
.vv..>>v..
v>.....vv.
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_3() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 3
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
v>v.v>.>v.
v...>>.v.v
>vv>.>v>..
>>v>v.>.v>
..>....v..
.>.>v>v..v
..v..v>vv>
v.v..>>v..
.v>....v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_4() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 4
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
v>..v.>>..
v.v.>.>.v.
>vv.>>.v>v
>>.>..v>.>
..v>v...v.
..>>.>vv..
>.v.vv>v.v
.....>>vv.
vvv>...v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_5() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 5
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
vv>...>v>.
v.v.v>.>v.
>.v.>.>.>v
>v>.>..v>>
..v>v.v...
..>.>>vvv.
.>...v>v..
..v.v>>v.v
v.v.>...v.
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_10() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 10
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..>..>>vv.
v.....>>.v
..v.v>>>v>
v>.>v.>>>.
..v>v.vv.v
.v.>>>.v..
v.v..>v>..
..v...>v.>
.vv..v>vv.
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_20() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 20
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
v>.....>>.
>vv>.....v
.>v>v.vv>>
v>>>v.>v.>
....vv>v..
.v.>>>vvv.
..v..>>vv.
v.v...>>.v
..v.....v>
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_30() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 30
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
.vv.v..>>>
v>...v...>
>.v>.>vv.>
>v>.>.>v.>
.>..v.vv..
..v>..>>v.
....v>..>v
v.v...>vv>
v.v...>vvv
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_40() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 40
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
>>v>v..v..
..>>v..vv.
..>>>v.>.v
..>>>>vvv>
v.....>...
v.v...>v>>
>vv.....v>
.>v...v.>v
vvv.v..v.>
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_50() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 50
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..>>v>vv.v
..v.>>vv..
v.>>v>>v..
..>>>>>vv.
vvv....>vv
..v....>>>
v>.......>
.vv>....v>
.>v.vv.v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_55() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 55
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..>>v>vv..
..v.>>vv..
..>>v>>vv.
..>>>>>vv.
v......>vv
v>v....>>v
vvv...>..>
>vv.....>.
.>v.vv.v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_56() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 56
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..>>v>vv..
..v.>>vv..
..>>v>>vv.
..>>>>>vv.
v......>vv
v>v....>>v
vvv....>.>
>vv......>
.>v.vv.v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_57() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 57
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..>>v>vv..
..v.>>vv..
..>>v>>vv.
..>>>>>vv.
v......>vv
v>v....>>v
vvv.....>>
>vv......>
.>v.vv.v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_2_58() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let countSteps = 58
    for _ in 0..<countSteps {
      _ = day.RunStep()
    }
    let string = """
..>>v>vv..
..v.>>vv..
..>>v>>vv.
..>>>>>vv.
v......>vv
v>v....>>v
vvv.....>>
>vv......>
.>v.vv.v..
"""
    let expected = string.components(separatedBy: ["\n"])
    let actual = day.GetGrid()
    XCTAssertEqual(expected, actual)
  }

  func testPart1_58() throws {
    let lines = input_1_2.components(separatedBy: ["\n"])
    day.Parse(lines: lines)
    let expected = 58
    let actual = day.Part1()
    XCTAssertEqual(expected, actual)
  }
}

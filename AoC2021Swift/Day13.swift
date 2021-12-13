import Foundation

/*

 --- Day 13: Transparent Origami ---

 You reach another volcanically active part of the cave. It would be nice if you could do some kind of thermal imaging so you could tell ahead of time which caves are too hot to safely enter.

 Fortunately, the submarine seems to be equipped with a thermal camera! When you activate it, you are greeted with:

 Congratulations on your purchase! To activate this infrared thermal imaging
 camera system, please enter the code found on page 1 of the manual.
 Apparently, the Elves have never used this feature. To your surprise, you manage to find the manual; as you go to open it, page 1 falls out. It's a large sheet of transparent paper! The transparent paper is marked with random dots and includes instructions on how to fold it up (your puzzle input). For example:

 6,10
 0,14
 9,10
 0,3
 10,4
 4,11
 6,0
 6,12
 4,1
 0,13
 10,12
 3,4
 3,0
 8,4
 1,10
 2,14
 8,10
 9,0

 fold along y=7
 fold along x=5
 The first section is a list of dots on the transparent paper. 0,0 represents the top-left coordinate. The first value, x, increases to the right. The second value, y, increases downward. So, the coordinate 3,0 is to the right of 0,0, and the coordinate 0,7 is below 0,0. The coordinates in this example form the following pattern, where # is a dot on the paper and . is an empty, unmarked position:

 ...#..#..#.
 ....#......
 ...........
 #..........
 ...#....#.#
 ...........
 ...........
 ...........
 ...........
 ...........
 .#....#.##.
 ....#......
 ......#...#
 #..........
 #.#........
 Then, there is a list of fold instructions. Each instruction indicates a line on the transparent paper and wants you to fold the paper up (for horizontal y=... lines) or left (for vertical x=... lines). In this example, the first fold instruction is fold along y=7, which designates the line formed by all of the positions where y is 7 (marked here with -):

 ...#..#..#.
 ....#......
 ...........
 #..........
 ...#....#.#
 ...........
 ...........
 -----------
 ...........
 ...........
 .#....#.##.
 ....#......
 ......#...#
 #..........
 #.#........
 Because this is a horizontal line, fold the bottom half up. Some of the dots might end up overlapping after the fold is complete, but dots will never appear exactly on a fold line. The result of doing this fold looks like this:

 #.##..#..#.
 #...#......
 ......#...#
 #...#......
 .#.#..#.###
 ...........
 ...........
 Now, only 17 dots are visible.

 Notice, for example, the two dots in the bottom left corner before the transparent paper is folded; after the fold is complete, those dots appear in the top left corner (at 0,0 and 0,1). Because the paper is transparent, the dot just below them in the result (at 0,3) remains visible, as it can be seen through the transparent paper.

 Also notice that some dots can end up overlapping; in this case, the dots merge together and become a single dot.

 The second fold instruction is fold along x=5, which indicates this line:

 #.##.|#..#.
 #...#|.....
 .....|#...#
 #...#|.....
 .#.#.|#.###
 .....|.....
 .....|.....
 Because this is a vertical line, fold left:

 #####
 #...#
 #...#
 #...#
 #####
 .....
 .....
 The instructions made a square!

 The transparent paper is pretty big, so for now, focus on just completing the first fold. After the first fold in the example above, 17 dots are visible - dots that end up overlapping after the fold is completed count as a single dot.

 How many dots are visible after completing just the first fold instruction on your transparent paper?

 Your puzzle answer was 655.

 --- Part Two ---

 Finish folding the transparent paper according to the instructions. The manual says the code is always eight capital letters.

 What code do you use to activate the infrared thermal imaging camera system?

 */

class Day13
{
  let GRID_SIZE = 2048
  let FOLD_X = 1
  let FOLD_Y = 2
  var grid:[Int] = []
  var foldTypes:[Int] = []
  var foldValues:[Int] = []
  var countFolds = 0
  var minX = Int.max
  var minY = Int.max
  var maxX = Int.min
  var maxY = Int.min

  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day13")
    Parse(lines:lines)

    if (part1)
    {
      let result = Part1()
      let expected = 655
      if (result != expected)
      {
        assert(result == expected, "Part1 is broken expected \(expected) got \(result)")
      }
      print("Day13 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      // JPZCUAUR
      let expectedStrings = """
..##.###..####..##..#..#..##..#..#.###.
...#.#..#....#.#..#.#..#.#..#.#..#.#..#
...#.#..#...#..#....#..#.#..#.#..#.#..#
...#.###...#...#....#..#.####.#..#.###.
#..#.#....#....#..#.#..#.#..#.#..#.#.#.
.##..#....####..##...##..#..#..##..#..#
"""
      let expected = expectedStrings.components(separatedBy: ["\n"])
      if (result != expected)
      {
        assert(result == expected, "Part2 is broken expected \(expected) got \(result)")
      }
      print("Day13 Part2:\n\(expectedStrings)")
    }
  }
  
  func Parse(lines:[String]) {
    grid = [Int](repeating: 0, count: GRID_SIZE*GRID_SIZE)
    foldTypes = []
    foldValues = []
    countFolds = 0
    for l in lines {
      if l.isEmpty {
        continue
      }
      if l.starts(with: "fold") {
        let toks = l.trimmingCharacters(in: .whitespaces).components(separatedBy: "=")
        let last = toks[0].last
        var foldType = 0
        if last == "x" {
          foldType = FOLD_X
        }
        else if last == "y" {
          foldType = FOLD_Y
        }
        else {
          assertionFailure()
        }
        let v = Int(toks[1])!

        foldTypes.append(foldType)
        foldValues.append(v)
        countFolds += 1
      }
      else {
        let toks = l.trimmingCharacters(in: .whitespaces).components(separatedBy: ",")
        let x = Int(toks[0])!
        let y = Int(toks[1])!
        let index = y*GRID_SIZE+x
        grid[index] = 1
      }
    }
  }

  func ApplyFold(fold:Int) {

    FindMinMax()

    let foldType = foldTypes[fold]
    let foldValue = foldValues[fold]
    if foldType == FOLD_X {
      let maxCount = maxX - foldValue
      for y in minY...maxY {
        for x in 1...maxCount {
          let xFrom = foldValue + x
          let fromIndex = y*GRID_SIZE+xFrom
          if grid[fromIndex] == 1 {
            let xTo = foldValue - x
            let toIndex = y*GRID_SIZE+xTo
            grid[toIndex] = 1
            grid[fromIndex] = 0
          }
        }
      }
    }
    else if foldType == FOLD_Y {
      let maxCount = maxY - foldValue
      for x in minX...maxX {
        for y in 1...maxCount {
          let yFrom = foldValue + y
          let yTo = foldValue - y
          let fromIndex = yFrom*GRID_SIZE+x
          if grid[fromIndex] == 1 {
            let toIndex = yTo*GRID_SIZE+x
            grid[toIndex] = 1
            grid[fromIndex] = 0
          }
        }
      }
    }
    else {
      assertionFailure()
    }
  }

  func CountDots() -> Int {
    var total = 0
    for v in grid {
      if v == 1 {
        total += 1
      }
    }
    return total
  }

  func FindMinMax()
  {
    minX = Int.max
    minY = Int.max
    maxX = Int.min
    maxY = Int.min

    for y in 0..<GRID_SIZE {
      for x in 0..<GRID_SIZE {
        let index = y*GRID_SIZE+x
        let v = grid[index]
        if v == 1 {
          minX = min(minX, x)
          minY = min(minY, y)
          maxX = max(maxX, x)
          maxY = max(maxY, y)
        }
      }
    }
  }

  func OutputGrid() -> [String] {
    var output:[String] = []
    FindMinMax()

    for y in minY...maxY {
      var l = ""
      for x in minX...maxX {
        let index = y*GRID_SIZE+x
        if grid[index] == 1 {
          l += "#"
        }
        else {
          l += "."
        }
      }
      output.append(l)
    }
    return output
  }

  func Part1() -> Int {
    ApplyFold(fold:0)
    return CountDots()
  }
  
  func Part2() -> [String] {
    for f in 0..<countFolds {
      ApplyFold(fold: f)
    }
    return OutputGrid()
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

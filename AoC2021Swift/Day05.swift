import Foundation

/*
 
 --- Day 5: Hydrothermal Venture ---
 
 You come across a field of hydrothermal vents on the ocean floor! These vents constantly produce large, opaque clouds, so it would be best to avoid them if possible.
 
 They tend to form in lines; the submarine helpfully produces a list of nearby lines of vents (your puzzle input) for you to review. For example:
 
 0,9 -> 5,9
 8,0 -> 0,8
 9,4 -> 3,4
 2,2 -> 2,1
 7,0 -> 7,4
 6,4 -> 2,0
 0,9 -> 2,9
 3,4 -> 1,4
 0,0 -> 8,8
 5,5 -> 8,2
 Each line of vents is given as a line segment in the format x1,y1 -> x2,y2 where x1,y1 are the coordinates of one end the line segment and x2,y2 are the coordinates of the other end. These line segments include the points at both ends. In other words:
 
 An entry like 1,1 -> 1,3 covers points 1,1, 1,2, and 1,3.
 An entry like 9,7 -> 7,7 covers points 9,7, 8,7, and 7,7.
 For now, only consider horizontal and vertical lines: lines where either x1 = x2 or y1 = y2.
 
 So, the horizontal and vertical lines from the above list would produce the following diagram:
 
 .......1..
 ..1....1..
 ..1....1..
 .......1..
 .112111211
 ..........
 ..........
 ..........
 ..........
 222111....
 
 In this diagram, the top left corner is 0,0 and the bottom right corner is 9,9. Each position is shown as the number of lines which cover that point or . if no line covers that point. The top-left pair of 1s, for example, comes from 2,2 -> 2,1; the very bottom row is formed by the overlapping lines 0,9 -> 5,9 and 0,9 -> 2,9.
 
 To avoid the most dangerous areas, you need to determine the number of points where at least two lines overlap. In the above example, this is anywhere in the diagram with a 2 or larger - a total of 5 points.
 
 Consider only horizontal and vertical lines. At how many points do at least two lines overlap?
 
 Your puzzle answer was 4728.
 
 --- Part Two ---
 
 Unfortunately, considering only horizontal and vertical lines doesn't give you the full picture; you need to also consider diagonal lines.
 
 Because of the limits of the hydrothermal vent mapping system, the lines in your list will only ever be horizontal, vertical, or a diagonal line at exactly 45 degrees. In other words:
 
 An entry like 1,1 -> 3,3 covers points 1,1, 2,2, and 3,3.
 An entry like 9,7 -> 7,9 covers points 9,7, 8,8, and 7,9.
 Considering all lines from the above example would now produce the following diagram:
 
 1.1....11.
 .111...2..
 ..2.1.111.
 ...1.2.2..
 .112313211
 ...1.2....
 ..1...1...
 .1.....1..
 1.......1.
 222111....
 
 You still need to determine the number of points where at least two lines overlap. In the above example, this is still anywhere in the diagram with a 2 or larger - now a total of 12 points.
 
 Consider all of the lines. At how many points do at least two lines overlap?
 */

class Day05
{
  let MAX_GRID = 1024
  var grid:[Int] = []
  
  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day05")
    
    if (part1)
    {
      let result = Part1(lines: lines)
      let expected = 4728
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day05 Part1: \(result)")
    }
    else
    {
      let result = Part2(lines: lines)
      let expected = 17717
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day05 Part2: \(result)")
    }
  }
  
  func drawLine(x0:Int, y0:Int, x1:Int, y1:Int, diagonal:Bool)
  {
    var dx = x1 - x0
    var dy = y1 - y0
    if (dx != 0) && (dy != 0) {
      if abs(dx) != abs(dy) {
        assertionFailure("Invalid line \(x0),\(y0) -> \(x1),\(y1)")
      }
      if (!diagonal) {
        //print("Ignoring line \(x0),\(y0) -> \(x1),\(y1)")
        return
      }
    }
    var steps = abs(dx)
    if abs(dy) > abs(dx) {
      steps = abs(dy)
    }
    if (dx != 0) {
      dx /= abs(dx)
    }
    if (dy != 0) {
      dy /= abs(dy)
    }
    for i in 0...steps {
      let x = x0 + i * dx
      let y = y0 + i * dy
      grid[y*MAX_GRID+x] += 1
    }
  }
  
  func Score(inputLines:[String], diagonal:Bool) -> Int {
    var lines:[Int] = []
    grid = [Int](repeating: 0, count: MAX_GRID*MAX_GRID)
    
    var countLines = 0
    for l in inputLines {
      if (l.isEmpty) {
        continue
      }
      let splitPoint = l.range(of: " -> ")!
      let lhs = l[l.startIndex...splitPoint.lowerBound].trimmingCharacters(in: .whitespaces)
      let rhs = l[splitPoint.upperBound..<l.endIndex].trimmingCharacters(in: .whitespaces)
      let from = lhs.split(separator: ",")
      let to = rhs.split(separator: ",")
      let x0 = Int(from[0].trimmingCharacters(in: .whitespaces))!
      let y0 = Int(from[1].trimmingCharacters(in: .whitespaces))!
      let x1 = Int(to[0].trimmingCharacters(in: .whitespaces))!
      let y1 = Int(to[1].trimmingCharacters(in: .whitespaces))!
      lines.append(x0)
      lines.append(y0)
      lines.append(x1)
      lines.append(y1)
      countLines += 1
    }
    for i in 0..<countLines {
      let x0 = lines[i*4+0]
      let y0 = lines[i*4+1]
      let x1 = lines[i*4+2]
      let y1 = lines[i*4+3]
      drawLine(x0:x0, y0:y0, x1:x1, y1:y1, diagonal:diagonal)
    }
    
    var score = 0
    for v in grid {
      if v >= 2 {
        score += 1
      }
    }
    return score
  }
  
  func Part1(lines:[String]) -> Int {
    return Score(inputLines: lines, diagonal: false)
  }
  
  func Part2(lines:[String]) -> Int {
    return Score(inputLines: lines, diagonal: true)
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

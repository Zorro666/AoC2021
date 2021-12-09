import Foundation

/*
 
 --- Day 9: Smoke Basin ---
 
 These caves seem to be lava tubes. Parts are even still volcanically active; small hydrothermal vents release smoke into the caves that slowly settles like rain.
 
 If you can model how the smoke flows through the caves, you might be able to avoid it and be that much safer. The submarine generates a heightmap of the floor of the nearby caves for you (your puzzle input).
 
 Smoke flows to the lowest point of the area it's in. For example, consider the following heightmap:
 
 2199943210
 3987894921
 9856789892
 8767896789
 9899965678
 Each number corresponds to the height of a particular location, where 9 is the highest and 0 is the lowest a location can be.
 
 Your first goal is to find the low points - the locations that are lower than any of its adjacent locations. Most locations have four adjacent locations (up, down, left, and right); locations on the edge or corner of the map have three or two adjacent locations, respectively. (Diagonal locations do not count as adjacent.)
 
 In the above example, there are four low points, all highlighted: two are in the first row (a 1 and a 0), one is in the third row (a 5), and one is in the bottom row (also a 5). All other locations on the heightmap have some lower adjacent location, and so are not low points.
 
 The risk level of a low point is 1 plus its height. In the above example, the risk levels of the low points are 2, 1, 6, and 6. The sum of the risk levels of all low points in the heightmap is therefore 15.
 
 Find all of the low points on your heightmap. What is the sum of the risk levels of all low points on your heightmap?
 
 Your puzzle answer was 496.
 
 --- Part Two ---
 
 Next, you need to find the largest basins so you know what areas are most important to avoid.
 
 A basin is all locations that eventually flow downward to a single low point. Therefore, every low point has a basin, although some basins are very small. Locations of height 9 do not count as being in any basin, and all other locations will always be part of exactly one basin.
 
 The size of a basin is the number of locations within the basin, including the low point. The example above has four basins.
 
 The top-left basin, size 3:
 
 2199943210
 3987894921
 9856789892
 8767896789
 9899965678
 The top-right basin, size 9:
 
 2199943210
 3987894921
 9856789892
 8767896789
 9899965678
 The middle basin, size 14:
 
 2199943210
 3987894921
 9856789892
 8767896789
 9899965678
 The bottom-right basin, size 9:
 
 2199943210
 3987894921
 9856789892
 8767896789
 9899965678
 Find the three largest basins and multiply their sizes together. In the above example, this is 9 * 14 * 9 = 1134.
 
 What do you get if you multiply together the sizes of the three largest basins?
 */

class Day09
{
  static var grid:[Int] = []
  static var visited:[Bool] = []
  static var width = 0
  static var height = 0
  static func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day09")
    Parse(lines:lines)
    
    if (part1)
    {
      let result = Part1()
      let expected = 496
      if (result != expected)
      {
        assert(result == expected, "Part1 is broken expected \(expected) got \(result)")
      }
      print("Day09 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 902880
      if (result != expected)
      {
        assert(result == expected, "Part2 is broken expected \(expected) got \(result)")
      }
      print("Day09 Part2: \(result)")
    }
  }
  
  static func Parse(lines:[String]) {
    width = lines[0].count
    height = 0
    grid = [Int](repeatElement(0, count: width*width))
    for l in lines {
      if (l.isEmpty) {
        continue
      }
      assert(width == l.count)
      let bytes = l.utf8CString
      for x in 0..<width {
        let v = bytes[x] - 48
        grid[height*width+x] = Int(v)
      }
      height += 1
    }
  }
  
  static func GetGrid(x:Int, y:Int) ->Int {
    if x < 0 || x >= width {
      assertionFailure()
    }
    if y < 0 || y >= height {
      assertionFailure()
    }
    return grid[y*width+x]
  }
  
  static func FindLowPoints() -> [Int] {
    var lowPoints:[Int] = []
    for y in 0..<height {
      for x in 0..<width {
        let val = GetGrid(x:x, y:y)
        if x > 0 && val >= GetGrid(x: x-1, y: y) {
          continue
        }
        if x < width-1 && val >= GetGrid(x: x+1, y: y) {
          continue
        }
        if y > 0 && val >= GetGrid(x: x, y: y-1) {
          continue
        }
        if y < height-1 && val >= GetGrid(x: x, y: y+1) {
          continue
        }
        lowPoints.append(y*width+x)
      }
    }
    return lowPoints
  }
  
  static func Part1() -> Int {
    var total = 0
    let lows = FindLowPoints()
    for l in lows {
      total += grid[l] + 1
    }
    return total
  }
  
  static func FindBasin(x:Int, y:Int) -> Int {
    var count = 0
    if visited[y*width+x] == true {
      return count;
    }
    if GetGrid(x: x, y: y) == 9 {
      return count
    }
    count += 1
    visited[y*width+x] = true
    if x > 0 {
      count += FindBasin(x:x-1, y:y)
    }
    if x < width-1 {
      count += FindBasin(x:x+1, y:y)
    }
    if y > 0 {
      count += FindBasin(x:x, y:y-1)
    }
    if y < height-1 {
      count += FindBasin(x:x, y:y+1)
    }
    return count
  }
  
  static func Part2() -> Int {
    let lows = FindLowPoints()
    var low0 = Int.min
    var low1 = Int.min
    var low2 = Int.min
    for l in lows {
      let y = l / width
      let x = l % width
      visited = [Bool](repeatElement(false, count: height*width))
      let lowSize = FindBasin(x:x, y:y)
      if lowSize > low0 {
        low2 = low1
        low1 = low0
        low0 = lowSize
      }
      else if lowSize > low1 {
        low2 = low1
        low1 = lowSize
      }
      else if lowSize > low2 {
        low2 = lowSize
      }
    }
    return low0*low1*low2
  }
  
  static func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

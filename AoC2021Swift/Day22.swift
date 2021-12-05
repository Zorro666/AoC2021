import Foundation

/*
 
 
 */

class Day22
{
  static func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day22")
    
    if (part1)
    {
      let result = Part1(lines: lines)
      let expected = 2117664
      if (result != expected)
      {
        assert(result == expected, "Part1 is broken expected \(expected) got \(result)")
      }
      print("Day22 Part1: \(result)")
    }
    else
    {
      let result = Part2(lines: lines)
      let expected = 2073416724
      if (result != expected)
      {
        assert(result == expected, "Part2 is broken expected \(expected) got \(result)")
      }
      print("Day22 Part2: \(result)")
    }
  }
  
  static func Part1(lines:[String]) -> Int {
    return 123
  }
  
  static func Part2(lines:[String]) -> Int {
    return 5443
  }
  
  static func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

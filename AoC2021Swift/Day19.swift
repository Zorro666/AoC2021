import Foundation

/*
 
 
 */

class Day19
{
  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day19")
    Parse(lines:lines)

    if (part1)
    {
      let result = Part1()
      let expected = 2117664
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day19 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 2073416724
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day19 Part2: \(result)")
    }
  }
  
  func Parse(lines:[String]) {
    for l in lines {
      if l.isEmpty {
        continue
      }
    }
  }

  func Part1() -> Int {
    return 123
  }
  
  func Part2() -> Int {
    return 5443
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

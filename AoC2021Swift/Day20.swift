import Foundation

/*


 */

class Day20
{
  static func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day20")

    if (part1)
    {
      let result = -10
      let expected = 2117664
      if (result != expected)
      {
        assert(result == expected, "Part1 is broken expected \(expected) got \(result)")
      }
      print("Day20 Part1: \(result)")
    }
    else
    {
      let result = -20
      let expected = 2073416724
      if (result != expected)
      {
        assert(result == expected, "Part2 is broken expected \(expected) got \(result)")
      }
      print("Day20 Part2: \(result)")
    }
  }

  static func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

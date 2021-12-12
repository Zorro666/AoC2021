import Foundation

class Program
{
  static func ReadLines(day:String) -> [String]
  {
    let fileURL = Bundle.main.url(forResource: day, withExtension: "txt")!
    let fileContents = try? String(contentsOf: fileURL)
    let myStrings = fileContents!.components(separatedBy: .newlines)
    return myStrings
  }

  func Run()
  {
    let args = CommandLine.arguments
    var dayToRun = -1
    if args.count  > 1 {
      dayToRun = Int(args[1])!
    }
    if (dayToRun == 1) || (dayToRun == -1) {
      Day01().Run()
    }
    if (dayToRun == 2) || (dayToRun == -1) {
      Day02().Run()
    }
    if (dayToRun == 3) || (dayToRun == -1) {
      Day03().Run()
    }
    if (dayToRun == 4) || (dayToRun == -1) {
      Day04().Run()
    }
    if (dayToRun == 5) || (dayToRun == -1) {
      Day05().Run()
    }
    if (dayToRun == 6) || (dayToRun == -1) {
      Day06().Run()
    }
    if (dayToRun == 7) || (dayToRun == -1) {
      Day07().Run()
    }
    if (dayToRun == 8) || (dayToRun == -1) {
      Day08().Run()
    }
    if (dayToRun == 9) || (dayToRun == -1) {
      Day09().Run()
    }
    if (dayToRun == 10) || (dayToRun == -1) {
      Day10().Run()
    }
    if (dayToRun == 11) || (dayToRun == -1) {
      Day11().Run()
    }
    if (dayToRun == 12) || (dayToRun == -1) {
      Day12().Run()
    }
    if (dayToRun == 13) || (dayToRun == -1) {
      Day13().Run()
    }
    if (dayToRun == 14) || (dayToRun == -1) {
      Day14().Run()
    }
    if (dayToRun == 15) || (dayToRun == -1) {
      Day15().Run()
    }
    if (dayToRun == 16) || (dayToRun == -1) {
      Day16().Run()
    }
    if (dayToRun == 17) || (dayToRun == -1) {
      Day17().Run()
    }
    if (dayToRun == 18) || (dayToRun == -1) {
      Day18().Run()
    }
    if (dayToRun == 19) || (dayToRun == -1) {
      Day19().Run()
    }
    if (dayToRun == 20) || (dayToRun == -1) {
      Day20().Run()
    }
    if (dayToRun == 21) || (dayToRun == -1) {
      Day21().Run()
    }
    if (dayToRun == 22) || (dayToRun == -1) {
      Day22().Run()
    }
    if (dayToRun == 23) || (dayToRun == -1) {
      Day23().Run()
    }
    if (dayToRun == 24) || (dayToRun == -1) {
      Day24().Run()
    }
    if (dayToRun == 25) || (dayToRun == -1) {
      Day25().Run()
    }
  }
}

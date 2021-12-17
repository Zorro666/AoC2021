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

  func PrintElapsed(from:DispatchTime, to:DispatchTime) {
    let elapsedNS = to.uptimeNanoseconds - from.uptimeNanoseconds
    let elapsedS:Float = Float(elapsedNS) / (1000.0 * 1000.0 * 1000.0)
    print("Elapsed: \(elapsedS)s")
  }

  func Run()
  {
    let totalStart = DispatchTime.now()
    let args = CommandLine.arguments
    var dayToRun = -1
    if args.count  > 1 {
      dayToRun = Int(args[1])!
    }
    if (dayToRun == 1) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day01().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 2) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day02().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 3) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day03().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 4) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day04().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 5) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day05().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 6) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day06().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 7) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day07().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 8) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day08().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 9) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day09().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 10) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day10().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 11) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day11().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 12) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day12().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 13) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day13().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 14) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day14().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 15) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day15().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 16) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day16().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 17) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day17().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 18) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day18().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 19) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day19().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 20) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day20().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 21) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day21().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 22) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day22().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 23) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day23().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 24) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day24().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    if (dayToRun == 25) || (dayToRun == -1) {
      let start = DispatchTime.now()
      Day25().Run()
      PrintElapsed(from:start, to:DispatchTime.now())
    }
    PrintElapsed(from:totalStart, to:DispatchTime.now())
  }
}

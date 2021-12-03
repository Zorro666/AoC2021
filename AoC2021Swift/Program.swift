import Foundation

class Program
{
  public static func ReadLines(day:String) -> [String]
  {
    let fileURL = Bundle.main.url(forResource: day, withExtension: "txt")!
    let fileContents = try? String(contentsOf: fileURL)
    let myStrings = fileContents!.components(separatedBy: .newlines)
    return myStrings
  }

  public static func Run()
  {
    let args = CommandLine.arguments
    var dayToRun = -1
    if args.count  > 1 {
      dayToRun = Int(args[1])!
    }
    if (dayToRun == 1) || (dayToRun == -1) {
      Day01.Run()
    }
    if (dayToRun == 2) || (dayToRun == -1) {
      Day02.Run()
    }
    if (dayToRun == 3) || (dayToRun == -1) {
      Day03.Run()
    }
    if (dayToRun == 4) || (dayToRun == -1) {
      Day04.Run()
    }
    if (dayToRun == 5) || (dayToRun == -1) {
      Day05.Run()
    }
    if (dayToRun == 6) || (dayToRun == -1) {
      Day06.Run()
    }
    if (dayToRun == 7) || (dayToRun == -1) {
      Day07.Run()
    }
    if (dayToRun == 8) || (dayToRun == -1) {
      Day08.Run()
    }
    if (dayToRun == 9) || (dayToRun == -1) {
      Day09.Run()
    }
    if (dayToRun == 10) || (dayToRun == -1) {
      Day10.Run()
    }
  }
}

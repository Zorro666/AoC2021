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
    Day01.Run()
    Day02.Run()
  }
}

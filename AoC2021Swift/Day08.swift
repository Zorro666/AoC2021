import Foundation

/*
 
 --- Day 8: Seven Segment Search ---
 
 You barely reach the safety of the cave when the whale smashes into the cave mouth, collapsing it. Sensors indicate another exit to this cave at a much greater depth, so you have no choice but to press on.
 
 As your submarine slowly makes its way through the cave system, you notice that the four-digit seven-segment displays in your submarine are malfunctioning; they must have been damaged during the escape. You'll be in a lot of trouble without them, so you'd better figure out what's wrong.
 
 Each digit of a seven-segment display is rendered by turning on or off any of seven segments named a through g:
 
 0:      1:      2:      3:      4:
 aaaa    ....    aaaa    aaaa    ....
 b    c  .    c  .    c  .    c  b    c
 b    c  .    c  .    c  .    c  b    c
 ....    ....    dddd    dddd    dddd
 e    f  .    f  e    .  .    f  .    f
 e    f  .    f  e    .  .    f  .    f
 gggg    ....    gggg    gggg    ....
 
 5:      6:      7:      8:      9:
 aaaa    aaaa    aaaa    aaaa    aaaa
 b    .  b    .  .    c  b    c  b    c
 b    .  b    .  .    c  b    c  b    c
 dddd    dddd    ....    dddd    dddd
 .    f  e    f  .    f  e    f  .    f
 .    f  e    f  .    f  e    f  .    f
 gggg    gggg    ....    gggg    gggg
 So, to render a 1, only segments c and f would be turned on; the rest would be off. To render a 7, only segments a, c, and f would be turned on.
 
 The problem is that the signals which control the segments have been mixed up on each display. The submarine is still trying to display numbers by producing output on signal wires a through g, but those wires are connected to segments randomly. Worse, the wire/segment connections are mixed up separately for each four-digit display! (All of the digits within a display use the same connections, though.)
 
 So, you might know that only signal wires b and g are turned on, but that doesn't mean segments b and g are turned on: the only digit that uses two segments is 1, so it must mean segments c and f are meant to be on. With just that information, you still can't tell which wire (b/g) goes to which segment (c/f). For that, you'll need to collect more information.
 
 For each display, you watch the changing signals for a while, make a note of all ten unique signal patterns you see, and then write down a single four digit output value (your puzzle input). Using the signal patterns, you should be able to work out which pattern corresponds to which digit.
 
 For example, here is what you might see in a single entry in your notes:
 
 acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab |
 cdfeb fcadb cdfeb cdbaf
 (The entry is wrapped here to two lines so it fits; in your notes, it will all be on a single line.)
 
 Each entry consists of ten unique signal patterns, a | delimiter, and finally the four digit output value. Within an entry, the same wire/segment connections are used (but you don't know what the connections actually are). The unique signal patterns correspond to the ten different ways the submarine tries to render a digit using the current wire/segment connections. Because 7 is the only digit that uses three segments, dab in the above example means that to render a 7, signal lines d, a, and b are on. Because 4 is the only digit that uses four segments, eafb means that to render a 4, signal lines e, a, f, and b are on.
 
 Using this information, you should be able to work out which combination of signal wires corresponds to each of the ten digits. Then, you can decode the four digit output value. Unfortunately, in the above example, all of the digits in the output value (cdfeb fcadb cdfeb cdbaf) use five segments and are more difficult to deduce.
 
 For now, focus on the easy digits. Consider this larger example:
 
 be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb |
 fdgacbe cefdb cefbgd gcbe
 edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec |
 fcgedb cgb dgebacf gc
 fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef |
 cg cg fdcagb cbg
 fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega |
 efabcd cedba gadfec cb
 aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga |
 gecf egdcabf bgf bfgea
 fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf |
 gebdcfa ecba ca fadegcb
 dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf |
 cefg dcbef fcge gbcadfe
 bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd |
 ed bcgafe cdgba cbgef
 egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg |
 gbdfcae bgc cg cgb
 gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc |
 fgae cfgab fg bagce
 Because the digits 1, 4, 7, and 8 each use a unique number of segments, you should be able to tell which combinations of signals correspond to those digits. Counting only digits in the output values (the part after | on each line), in the above example, there are 26 instances of digits that use a unique number of segments (highlighted above).
 
 In the output values, how many times do digits 1, 4, 7, or 8 appear?
 
 Your puzzle answer was 237.
 
 --- Part Two ---
 
 Through a little deduction, you should now be able to determine the remaining digits. Consider again the first example above:
 
 acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab |
 cdfeb fcadb cdfeb cdbaf
 After some careful analysis, the mapping between signal wires and segments only make sense in the following configuration:
 
 dddd
 e    a
 e    a
 ffff
 g    b
 g    b
 cccc
 So, the unique signal patterns would correspond to the following digits:
 
 acedgfb: 8
 cdfbe: 5
 gcdfa: 2
 fbcad: 3
 dab: 7
 cefabd: 9
 cdfgeb: 6
 eafb: 4
 cagedb: 0
 ab: 1
 Then, the four digits of the output value can be decoded:
 
 cdfeb: 5
 fcadb: 3
 cdfeb: 5
 cdbaf: 3
 Therefore, the output value for this entry is 5353.
 
 Following this same process for each entry in the second, larger example above, the output value of each entry can be determined:
 
 fdgacbe cefdb cefbgd gcbe: 8394
 fcgedb cgb dgebacf gc: 9781
 cg cg fdcagb cbg: 1197
 efabcd cedba gadfec cb: 9361
 gecf egdcabf bgf bfgea: 4873
 gebdcfa ecba ca fadegcb: 8418
 cefg dcbef fcge gbcadfe: 4548
 ed bcgafe cdgba cbgef: 1625
 gbdfcae bgc cg cgb: 8717
 fgae cfgab fg bagce: 4315
 Adding all of the output values in this larger example produces 61229.
 
 For each entry, determine all of the wire/segment connections and decode the four-digit output values. What do you get if you add up all of the output values?
 
 // 0 : abcefg
 // 1 : cf
 // 2 : acdeg
 // 3 : acdfg
 // 4 : bcdf
 // 5 : abdfg
 // 6 : abdefg
 // 7 : acf
 // 8 : abcdefg
 // 9 : abcdfg
 
 */

class Day08
{
  var signals:[String] = []
  var outputs:[String] = []
  var countMessages:Int = 0
  
  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day08")
    Parse(lines:lines)
    
    if (part1)
    {
      let result = Part1()
      let expected = 237
      if (result != expected)
      {
        assert(result == expected, "Part1 is broken expected \(expected) got \(result)")
      }
      print("Day08 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 1009098
      if (result != expected)
      {
        assert(result == expected, "Part2 is broken expected \(expected) got \(result)")
      }
      print("Day08 Part2: \(result)")
    }
  }
  
  func Parse(lines:[String]) {
    countMessages = 0
    signals = [String](repeating: "", count: 1000*10)
    outputs = [String](repeating: "", count: 1000*4)
    var m = 0
    for l in lines {
      if (l.isEmpty) {
        continue
      }
      // be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
      let sides = l.components(separatedBy: "|")
      let lhs = sides[0].trimmingCharacters(in: .whitespaces)
      let inputs = lhs.components(separatedBy: .whitespaces)
      for i in 0..<10 {
        signals[m*10+i] = inputs[i].trimmingCharacters(in: .whitespaces)
      }
      let rhs = sides[1].trimmingCharacters(in: .whitespaces)
      let codes = rhs.components(separatedBy: .whitespaces)
      for i in 0..<4 {
        outputs[m*4+i] = codes[i].trimmingCharacters(in: .whitespaces)
      }
      m += 1
    }
    countMessages = m
  }
  
  func Contains(a:String, b:String) -> Bool {
    for c in b {
      if !a.contains(c) {
        return false
      }
    }
    return true
  }
  
  func FindByCount(message:Int, count:Int) -> String {
    for s in 0..<10 {
      let signal = signals[message*10+s]
      if signal.count == count {
        return signal
      }
    }
    assertionFailure()
    return ""
  }
  
  func FindByStringAndCount(message:Int, string:String, count:Int) -> String {
    for s in 0..<10 {
      let signal = signals[message*10+s]
      if signal == string {
        continue
      }
      if signal.count == count {
        if Contains(a:signal, b:string) {
          return signal
        }
      }
    }
    assertionFailure()
    return ""
  }
  
  func Difference(a:String, b:String) -> String {
    var diff = ""
    for c in a {
      if !b.contains(c) {
        diff += String(c)
      }
    }
    for c in b {
      if !a.contains(c) {
        diff += String(c)
      }
    }
    return diff
  }
  
  // 0 : abcefg
  // 1 : cf
  // 2 : acdeg
  // 3 : acdfg
  // 4 : bcdf
  // 5 : abdfg
  // 6 : abdefg
  // 7 : acf
  // 8 : abcdefg
  // 9 : abcdfg
  
  // 1 : cf
  // 7 : acf
  // 4 : bcdf
  // 2 : acdeg
  // 3 : acdfg
  // 5 : abdfg
  // 0 : abcefg
  // 6 : abdefg
  // 9 : abcdfg
  // 8 : abcdefg
  
  // 1 + 4 + 7 = ABCDF -> EG
  // Difference between 1 & 7 = A
  // Find 6 char inputs which contain 4 -> 9
  // Difference between 9 & 4 : gives AG -> G
  // Find 5 char inputs which contain 7 -> 3
  // Difference between 3 & 1 : gives ADG -> D
  // Difference between 8 & 4 : gives AEG -> E
  // Difference between 9 & 3 : gives B
  // Find 5 char inputs which contain ABDG -> 5
  // Difference between 5 & ABDG: gives F
  
  func DecodeMessage(message:Int) -> Int {
    let one = FindByCount(message: message, count: 2)
    let four = FindByCount(message: message, count: 4)
    let seven = FindByCount(message: message, count: 3)
    let eight = FindByCount(message: message, count: 7)
    
    let three = FindByStringAndCount(message:message, string:seven, count:5)
    let nine = FindByStringAndCount(message:message, string:four, count:6)
    
    let AG = Difference(a: nine, b: four)
    let AEG = Difference(a: eight, b: four)
    
    let A = Difference(a:one, b:seven)
    let B = Difference(a: nine, b: three)
    let D = Difference(a: three, b: one)
    let E = Difference(a: AEG, b: AG)
    let G = Difference(a: A, b: AG)
    let ABDG = A + B + D + G
    let five = FindByStringAndCount(message: message, string: ABDG, count: 5)
    let F = Difference(a: five, b: ABDG)
    let ABDEFG = ABDG + E + F
    let C = Difference(a: eight, b: ABDEFG)
    
    // 0 : abcefg
    let nought = A + B + C + E + F + G
    // 2 : acdeg
    let two = A + C + D + E + G
    // 6 : abdefg
    let six = A + B + D + E + F + G
    
    let decode:[String] = [nought, one, two, three, four, five, six, seven, eight, nine]
    
    var total = 0
    for i in 0..<4 {
      let o = outputs[message*4+i]
      for v in 0..<10 {
        if Difference(a: decode[v], b: o).isEmpty {
          total *= 10
          total += v
          break
        }
      }
    }
    return total
  }
  
  func CountOutputsByLength(len:Int) -> Int {
    var ones = 0
    for m in 0..<countMessages {
      for i in 0..<4 {
        let s = outputs[m*4+i]
        if s.count == len {
          ones += 1
        }
      }
    }
    return ones
  }
  
  func Part1() -> Int {
    let ones = CountOutputsByLength(len: 2)
    let fours = CountOutputsByLength(len: 4)
    let sevens = CountOutputsByLength(len: 3)
    let eights = CountOutputsByLength(len: 7)
    
    return ones + fours + sevens + eights
  }
  
  func Part2() -> Int {
    var total = 0
    for m in 0..<countMessages {
      total += DecodeMessage(message: m)
    }
    return total
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

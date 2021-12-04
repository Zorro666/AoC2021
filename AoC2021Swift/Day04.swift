import Foundation

/*

 --- Day 4: Giant Squid ---

 You're already almost 1.5km (almost a mile) below the surface of the ocean, already so deep that you can't see any sunlight. What you can see, however, is a giant squid that has attached itself to the outside of your submarine.

 Maybe it wants to play bingo?

 Bingo is played on a set of boards each consisting of a 5x5 grid of numbers. Numbers are chosen at random, and the chosen number is marked on all boards on which it appears. (Numbers may not appear on all boards.) If all numbers in any row or any column of a board are marked, that board wins. (Diagonals don't count.)

 The submarine has a bingo subsystem to help passengers (currently, you and the giant squid) pass the time. It automatically generates a random order in which to draw numbers and a random set of boards (your puzzle input). For example:

 7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

 22 13 17 11  0
  8  2 23  4 24
 21  9 14 16  7
  6 10  3 18  5
  1 12 20 15 19

  3 15  0  2 22
  9 18 13 17  5
 19  8  7 25 23
 20 11 10 24  4
 14 21 16 12  6

 14 21 17 24  4
 10 16 15  9 19
 18  8 23 26 20
 22 11 13  6  5
  2  0 12  3  7
 After the first five numbers are drawn (7, 4, 9, 5, and 11), there are no winners, but the boards are marked as follows (shown here adjacent to each other to save space):

 22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
  8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
 21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
  6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
  1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
 After the next six numbers are drawn (17, 23, 2, 0, 14, and 21), there are still no winners:

 22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
  8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
 21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
  6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
  1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
 Finally, 24 is drawn:

 22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
  8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
 21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
  6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
  1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
 At this point, the third board wins because it has at least one complete row or column of marked numbers (in this case, the entire top row is marked: 14 21 17 24 4).

 The score of the winning board can now be calculated. Start by finding the sum of all unmarked numbers on that board; in this case, the sum is 188. Then, multiply that sum by the number that was just called when the board won, 24, to get the final score, 188 * 24 = 4512.

 To guarantee victory against the giant squid, figure out which board will win first. What will your final score be if you choose that board?

 Your puzzle answer was 35711.

 --- Part Two ---

 On the other hand, it might be wise to try a different strategy: let the giant squid win.

 You aren't sure how many bingo boards a giant squid could play at once, so rather than waste time counting its arms, the safe thing to do is to figure out which board will win last and choose that one. That way, no matter which boards it picks, it will win for sure.

 In the above example, the second board is the last to win, which happens after 13 is eventually called and its middle column is completely marked. If you were to keep playing until this point, the second board would have a sum of unmarked numbers equal to 148 for a final score of 148 * 13 = 1924.

 Figure out which board will win last. Once it wins, what would its final score be?
 
 */

class Day04
{
  static func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day04")

    if (part1)
    {
      let result = Part1(lines: lines)
      let expected = 35711
      if (result != expected)
      {
        assert(result == expected, "Part1 is broken expected \(expected) got \(result)")
      }
      print("Day04 Part1: \(result)")
    }
    else
    {
      let result = Part2(lines: lines)
      let expected = 5586
      if (result != expected)
      {
        assert(result == expected, "Part2 is broken expected \(expected) got \(result)")
      }
      print("Day04 Part2: \(result)")
    }
  }

  static var boards:[Int] = []
  static var boardsUsed:[Bool] = []
  static var values:[Int] = []

  static func Parse(lines:[String]) -> Int {
    for t in lines[0].split(separator: ",") {
      let v = Int(t)!
      values.append(v)
    }

    var boardStart = true
    var b = 0
    var y = 0
    for i in 1..<lines.count {
      let line = lines[i]
      if line.isEmpty && boardStart {
        y = 0
        boardStart = false
        continue
      }
      assert(!line.isEmpty)
      assert(!boardStart)

      var x = 0
      for t in line.split(separator: " ") {
        assert(x < 5)
        boards.append(Int(t)!)
        boardsUsed.append(false)
        x += 1
      }
      y += 1
      if (y == 5) {
        boardStart = true
        b += 1
      }
    }
    return b
  }

  static func ComputeScore(bingoBoard:Int) -> Int {
    var score = 0
    for y in 0..<5 {
      for x in 0..<5 {
        let index = bingoBoard*25+y*5+x
        if boardsUsed[index] == false {
          score += boards[index]
        }
      }
    }
    return score
  }

  static func PlayBingo(lines:[String], firstScore:Bool) -> Int {
    let b = Parse(lines:lines)

    let boardCount = boards.count
    var bingo = false
    var score = -1
    var completedBoards:[Bool] = []
    for _ in 0..<b {
      completedBoards.append(false)
    }

    for v in values {
      for i in 0..<boardCount {
        if (boards[i] == v) {
          boardsUsed[i] = true
        }
      }
      bingo = false
      // Check for completed rows or columns
      for i in 0..<b {
        if (completedBoards[i]) {
          continue
        }
        for y in 0..<5 {
          bingo = true
          for x in 0..<5 {
            let index = i*25+y*5+x
            if boardsUsed[index] == false {
              bingo = false
              break
            }
          }
          if bingo {
            completedBoards[i] = true
            score = ComputeScore(bingoBoard: i) * v
            if (firstScore) {
              return score
            }
          }
        }
        for x in 0..<5 {
          bingo = true
          for y in 0..<5 {
            let index = i*25+y*5+x
            if boardsUsed[index] == false {
              bingo = false
              break
            }
          }
          if bingo {
            completedBoards[i] = true
            score = ComputeScore(bingoBoard: i) * v
            if (firstScore) {
              return score
            }
          }
        }
      }
    }
    return score
  }

  static func Part1(lines:[String]) -> Int {
    return PlayBingo(lines:lines, firstScore:true)
  }

  static func Part2(lines:[String]) -> Int {
    return PlayBingo(lines:lines, firstScore:false)
  }

  static func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

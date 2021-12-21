import Foundation

/*

 --- Day 21: Dirac Dice ---

 There's not much to do as you slowly descend to the bottom of the ocean. The submarine computer challenges you to a nice game of Dirac Dice.

 This game consists of a single die, two pawns, and a game board with a circular track containing ten spaces marked 1 through 10 clockwise. Each player's starting space is chosen randomly (your puzzle input). Player 1 goes first.

 Players take turns moving. On each player's turn, the player rolls the die three times and adds up the results. Then, the player moves their pawn that many times forward around the track (that is, moving clockwise on spaces in order of increasing value, wrapping back around to 1 after 10). So, if a player is on space 7 and they roll 2, 2, and 1, they would move forward 5 times, to spaces 8, 9, 10, 1, and finally stopping on 2.

 After each player moves, they increase their score by the value of the space their pawn stopped on. Players' scores start at 0. So, if the first player starts on space 7 and rolls a total of 5, they would stop on space 2 and add 2 to their score (for a total score of 2). The game immediately ends as a win for any player whose score reaches at least 1000.

 Since the first game is a practice game, the submarine opens a compartment labeled deterministic dice and a 100-sided die falls out. This die always rolls 1 first, then 2, then 3, and so on up to 100, after which it starts over at 1 again. Play using this die.

 For example, given these starting positions:

 Player 1 starting position: 4
 Player 2 starting position: 8
 This is how the game would go:

 Player 1 rolls 1+2+3 and moves to space 10 for a total score of 10.
 Player 2 rolls 4+5+6 and moves to space 3 for a total score of 3.
 Player 1 rolls 7+8+9 and moves to space 4 for a total score of 14.
 Player 2 rolls 10+11+12 and moves to space 6 for a total score of 9.
 Player 1 rolls 13+14+15 and moves to space 6 for a total score of 20.
 Player 2 rolls 16+17+18 and moves to space 7 for a total score of 16.
 Player 1 rolls 19+20+21 and moves to space 6 for a total score of 26.
 Player 2 rolls 22+23+24 and moves to space 6 for a total score of 22.
 ...after many turns...

 Player 2 rolls 82+83+84 and moves to space 6 for a total score of 742.
 Player 1 rolls 85+86+87 and moves to space 4 for a total score of 990.
 Player 2 rolls 88+89+90 and moves to space 3 for a total score of 745.
 Player 1 rolls 91+92+93 and moves to space 10 for a final score, 1000.
 Since player 1 has at least 1000 points, player 1 wins and the game ends. At this point, the losing player had 745 points and the die had been rolled a total of 993 times; 745 * 993 = 739785.

 Play a practice game using the deterministic 100-sided die. The moment either player wins, what do you get if you multiply the score of the losing player by the number of times the die was rolled during the game?

 Your puzzle answer was 1006866.

 --- Part Two ---

 Now that you're warmed up, it's time to play the real game.

 A second compartment opens, this time labeled Dirac dice. Out of it falls a single three-sided die.

 As you experiment with the die, you feel a little strange. An informational brochure in the compartment explains that this is a quantum die: when you roll it, the universe splits into multiple copies, one copy for each possible outcome of the die. In this case, rolling the die always splits the universe into three copies: one where the outcome of the roll was 1, one where it was 2, and one where it was 3.

 The game is played the same as before, although to prevent things from getting too far out of hand, the game now ends when either player's score reaches at least 21.

 Using the same starting positions as in the example above, player 1 wins in 444356092776315 universes, while player 2 merely wins in 341960390180808 universes.

 Using your given starting positions, determine every possible outcome. Find the player that wins in more universes; in how many universes does that player win?
 */

class Day21
{
  var playerStarts:[Int] = []
  var playerPos:[Int] = []
  var playerPoints:[Int] = []

  var countDieRolls = 0
  var dieValue = 0
  var totalFreq:[Int] = []
  var countWins:[Int] = []

  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day21")
    Parse(lines:lines)

    if (part1)
    {
      let result = Part1()
      let expected = 1006866
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day21 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 273042027784929
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day21 Part2: \(result)")
    }
  }
  
  func Parse(lines:[String]) {
    playerStarts = [Int](repeating: 0, count: 2)
    playerPos = [Int](repeating: 0, count: 2)
    playerPoints = [Int](repeating: 0, count: 2)
    var p = 0
    for l in lines {
      if l.isEmpty {
        continue
      }
      let toks = l.components(separatedBy: .whitespaces)
      if toks[0] == "Player" && toks[2] == "starting" && toks[3] == "position:" {
        let pos = Int(toks[4])!
        playerStarts[p] = pos
      }
      else {
        assertionFailure()
      }
      p += 1
    }
    assert(2 == p)
  }

  // 100 1 2
  // 103 -> 3 : 300 + 3 : 303 % 100 -> 3
  // n + (n+1) + (n+2)
  // (3n + 3 ) % 100
  func Part1() -> Int {
    playerPoints[0] = 0
    playerPoints[1] = 0
    // 0 -- 9 : instead 1 -- 10
    playerPos[0] = playerStarts[0] - 1
    playerPos[1] = playerStarts[1] - 1
    countDieRolls = 0
    dieValue = 1
    var p = 0
    while (playerPoints[p] < 1000) {
      let totalRoll = (3 * dieValue + 3) % 100
      dieValue += 3
      dieValue %= 100
      countDieRolls += 3
      playerPos[p] += totalRoll
      playerPos[p] = playerPos[p] % 10
      playerPoints[p] += (playerPos[p] + 1)
      if (playerPoints[p] >= 1000) {
        break
      }
      p ^= 1
    }
    let minPoints = min(playerPoints[0], playerPoints[1])
    return countDieRolls * minPoints
  }

  func TakeTurn(p:Int, pos0:Int, pos1:Int, point0:Int, point1:Int, countUniverses:Int) {
    for totalRoll in 3...9 {
      let newCountUniverses = countUniverses * totalFreq[totalRoll]
      var newPos = p == 0 ? pos0 : pos1
      var newPoints = p == 0 ? point0 : point1
      newPos += totalRoll
      newPos %= 10
      newPoints += (newPos + 1)

      if newPoints >= 21 {
        countWins[p] += newCountUniverses
        continue
      }
      var newPos0 = pos0
      var newPos1 = pos1
      var newPoint0 = point0
      var newPoint1 = point1
      if p == 0 {
        newPos0 = newPos
        newPoint0 = newPoints
      }
      else {
        newPos1 = newPos
        newPoint1 = newPoints
      }
      TakeTurn(p: p ^ 1, pos0: newPos0, pos1: newPos1, point0: newPoint0, point1: newPoint1, countUniverses: newCountUniverses)
    }
  }

  func Part2() -> Int {
    // 1 x 3
    // 3 x 4
    // 6 x 5
    // 7 x 6
    // 6 x 7
    // 3 x 8
    // 1 x 9
    totalFreq = [Int](repeating: 0, count: 10)
    totalFreq[3] = 1
    totalFreq[4] = 3
    totalFreq[5] = 6
    totalFreq[6] = 7
    totalFreq[7] = 6
    totalFreq[8] = 3
    totalFreq[9] = 1
    countWins = [Int](repeating: 0, count: 2)
    playerPoints[0] = 0
    playerPoints[1] = 0
    // 0 -- 9 : instead 1 -- 10
    playerPos[0] = playerStarts[0] - 1
    playerPos[1] = playerStarts[1] - 1

    TakeTurn(p:0, pos0: playerPos[0], pos1: playerPos[1], point0: 0, point1: 0, countUniverses: 1)

    // All possible games
    // branching : die
    // 3 rolls : 9 combinations
    // n x total
    // 1 x 3
    // 3 x 4
    // 6 x 5
    // 7 x 6
    // 6 x 7
    // 3 x 8
    // 1 x 9

    // 1 1 1 = 3
    // 1 1 2 = 4
    // 1 1 3 = 5
    // 1 2 1 = 4
    // 1 2 2 = 5
    // 1 2 3 = 6
    // 1 3 1 = 5
    // 1 3 2 = 6
    // 1 3 3 = 7
    // 2 1 1 = 4
    // 2 1 2 = 5
    // 2 1 3 = 6
    // 2 2 1 = 5
    // 2 2 2 = 6
    // 2 2 3 = 7
    // 2 3 1 = 6
    // 2 3 2 = 7
    // 2 3 3 = 8
    // 3 1 1 = 5
    // 3 1 2 = 6
    // 3 1 3 = 7
    // 3 2 1 = 6
    // 3 2 2 = 7
    // 3 2 3 = 8
    // 3 3 1 = 7
    // 3 3 2 = 8
    // 3 3 3 = 9
    return max(countWins[0], countWins[1])
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

import Foundation

/*
 
 --- Day 23: Amphipod ---
 
 A group of amphipods notice your fancy submarine and flag you down. "With such an impressive shell," one amphipod says, "surely you can help us with a question that has stumped our best scientists."
 
 They go on to explain that a group of timid, stubborn amphipods live in a nearby burrow. Four types of amphipods live there: Amber (A), Bronze (B), Copper (C), and Desert (D). They live in a burrow that consists of a hallway and four side rooms. The side rooms are initially full of amphipods, and the hallway is initially empty.
 
 They give you a diagram of the situation (your puzzle input), including locations of each amphipod (A, B, C, or D, each of which is occupying an otherwise open space), walls (#), and open space (.).
 
 For example:
 
 #############
 #...........#
 ###B#C#B#D###
 #A#D#C#A#
 #########
 The amphipods would like a method to organize every amphipod into side rooms so that each side room contains one type of amphipod and the types are sorted A-D going left to right, like this:
 
 #############
 #...........#
 ###A#B#C#D###
 #A#B#C#D#
 #########
 Amphipods can move up, down, left, or right so long as they are moving into an unoccupied open space. Each type of amphipod requires a different amount of energy to move one step: Amber amphipods require 1 energy per step, Bronze amphipods require 10 energy, Copper amphipods require 100, and Desert ones require 1000. The amphipods would like you to find a way to organize the amphipods that requires the least total energy.
 
 However, because they are timid and stubborn, the amphipods have some extra rules:
 
 Amphipods will never stop on the space immediately outside any room. They can move into that space so long as they immediately continue moving. (Specifically, this refers to the four open spaces in the hallway that are directly above an amphipod starting position.)
 Amphipods will never move from the hallway into a room unless that room is their destination room and that room contains no amphipods which do not also have that room as their own destination. If an amphipod's starting room is not its destination room, it can stay in that room until it leaves the room. (For example, an Amber amphipod will not move from the hallway into the right three rooms, and will only move into the leftmost room if that room is empty or if it only contains other Amber amphipods.)
 Once an amphipod stops moving in the hallway, it will stay in that spot until it can move into a room. (That is, once any amphipod starts moving, any other amphipods currently in the hallway are locked in place and will not move again until they can move fully into a room.)
 In the above example, the amphipods can be organized using a minimum of 12521 energy. One way to do this is shown below.
 
 Starting configuration:
 
 #############
 #...........#
 ###B#C#B#D###
 #A#D#C#A#
 #########
 One Bronze amphipod moves into the hallway, taking 4 steps and using 40 energy:
 
 #############
 #...B.......#
 ###B#C#.#D###
 #A#D#C#A#
 #########
 The only Copper amphipod not in its side room moves there, taking 4 steps and using 400 energy:
 
 #############
 #...B.......#
 ###B#.#C#D###
 #A#D#C#A#
 #########
 A Desert amphipod moves out of the way, taking 3 steps and using 3000 energy, and then the Bronze amphipod takes its place, taking 3 steps and using 30 energy:
 
 #############
 #.....D.....#
 ###B#.#C#D###
 #A#B#C#A#
 #########
 The leftmost Bronze amphipod moves to its room using 40 energy:
 
 #############
 #.....D.....#
 ###.#B#C#D###
 #A#B#C#A#
 #########
 Both amphipods in the rightmost room move into the hallway, using 2003 energy in total:
 
 #############
 #.....D.D.A.#
 ###.#B#C#.###
 #A#B#C#.#
 #########
 Both Desert amphipods move into the rightmost room using 7000 energy:
 
 #############
 #.........A.#
 ###.#B#C#D###
 #A#B#C#D#
 #########
 Finally, the last Amber amphipod moves into its room, using 8 energy:
 
 #############
 #...........#
 ###A#B#C#D###
 #A#B#C#D#
 #########
 What is the least energy required to organize the amphipods?
 
 Your puzzle answer was 15338.
 
 --- Part Two ---
 
 As you prepare to give the amphipods your solution, you notice that the diagram they handed you was actually folded up. As you unfold it, you discover an extra part of the diagram.
 
 Between the first and second lines of text that contain amphipod starting positions, insert the following lines:
 
 #D#C#B#A#
 #D#B#A#C#
 So, the above example now becomes:
 
 #############
 #...........#
 ###B#C#B#D###
 #D#C#B#A#
 #D#B#A#C#
 #A#D#C#A#
 #########
 The amphipods still want to be organized into rooms similar to before:
 
 #############
 #...........#
 ###A#B#C#D###
   #A#B#C#D#
   #A#B#C#D#
   #A#B#C#D#
   #########
 In this updated example, the least energy required to organize these amphipods is 44169:
 
 #############
 #...........#
 ###B#C#B#D###
   #D#C#B#A#
   #D#B#A#C#
   #A#D#C#A#
   #########
 
 #############
 #..........D#
 ###B#C#B#.###
   #D#C#B#A#
   #D#B#A#C#
   #A#D#C#A#
   #########
 
 #############
 #A.........D#
 ###B#C#B#.###
   #D#C#B#.#
   #D#B#A#C#
   #A#D#C#A#
   #########
 
 #############
 #A........BD#
 ###B#C#.#.###
   #D#C#B#.#
   #D#B#A#C#
   #A#D#C#A#
   #########
 
 #############
 #A......B.BD#
 ###B#C#.#.###
   #D#C#.#.#
   #D#B#A#C#
   #A#D#C#A#
   #########
 
 #############
 #AA.....B.BD#
 ###B#C#.#.###
   #D#C#.#.#
   #D#B#.#C#
   #A#D#C#A#
   #########
 
 #############
 #AA.....B.BD#
 ###B#.#.#.###
   #D#C#.#.#
   #D#B#C#C#
   #A#D#C#A#
   #########
 
 #############
 #AA.....B.BD#
 ###B#.#.#.###
   #D#.#C#.#
   #D#B#C#C#
   #A#D#C#A#
   #########
 
 #############
 #AA...B.B.BD#
 ###B#.#.#.###
   #D#.#C#.#
   #D#.#C#C#
   #A#D#C#A#
   #########
 
 #############
 #AA.D.B.B.BD#
 ###B#.#.#.###
   #D#.#C#.#
   #D#.#C#C#
   #A#.#C#A#
   #########
 
 #############
 #AA.D...B.BD#
 ###B#.#.#.###
   #D#.#C#.#
   #D#.#C#C#
   #A#B#C#A#
   #########
 
 #############
 #AA.D.....BD#
 ###B#.#.#.###
   #D#.#C#.#
   #D#B#C#C#
   #A#B#C#A#
   #########
 
 #############
 #AA.D......D#
 ###B#.#.#.###
   #D#B#C#.#
   #D#B#C#C#
   #A#B#C#A#
   #########
 
 #############
 #AA.D......D#
 ###B#.#C#.###
   #D#B#C#.#
   #D#B#C#.#
   #A#B#C#A#
   #########
 
 #############
 #AA.D.....AD#
 ###B#.#C#.###
   #D#B#C#.#
   #D#B#C#.#
   #A#B#C#.#
   #########
 
 #############
 #AA.......AD#
 ###B#.#C#.###
   #D#B#C#.#
   #D#B#C#.#
   #A#B#C#D#
   #########
 
 #############
 #AA.......AD#
 ###.#B#C#.###
   #D#B#C#.#
   #D#B#C#.#
   #A#B#C#D#
   #########
 
 #############
 #AA.......AD#
 ###.#B#C#.###
   #.#B#C#.#
   #D#B#C#D#
   #A#B#C#D#
   #########
 
 #############
 #AA.D.....AD#
 ###.#B#C#.###
   #.#B#C#.#
   #.#B#C#D#
   #A#B#C#D#
   #########
 
 #############
 #A..D.....AD#
 ###.#B#C#.###
   #.#B#C#.#
   #A#B#C#D#
   #A#B#C#D#
   #########
 
 #############
 #...D.....AD#
 ###.#B#C#.###
   #A#B#C#.#
   #A#B#C#D#
   #A#B#C#D#
   #########
 
 #############
 #.........AD#
 ###.#B#C#.###
   #A#B#C#D#
   #A#B#C#D#
   #A#B#C#D#
   #########
 
 #############
 #..........D#
 ###A#B#C#.###
   #A#B#C#D#
   #A#B#C#D#
   #A#B#C#D#
   #########
 
 #############
 #...........#
 ###A#B#C#D###
   #A#B#C#D#
   #A#B#C#D#
   #A#B#C#D#
   #########
 
 Using the initial configuration from the full diagram, what is the least energy required to organize the amphipods?
 */

class Day23
{
  let COUNT_PIECES = 16
  let COUNT_LOCATIONS = 23
  
  var pieceStartLocations:[Int] = []
  var pieceLocations:[Int] = []
  var pieceTypes:[Int] = []
  var pieceCosts:[Int] = []
  var moveCosts:[[Int]] = []
  var nextMoveSpot:[[Int]] = []
  var locationTypes:[Int] = []
  
  var minCost:Int = Int.max
  var states:[Int] = []

  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day23")
    Parse(lines:lines)
    
    if (part1)
    {
      let result = Part1()
      let expected = 15338
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day23 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 47064
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day23 Part2: \(result)")
    }
  }
  
  func Parse(lines:[String]) {
    pieceTypes = [Int](repeating: 0, count: COUNT_PIECES)
    pieceCosts = [Int](repeating: 0, count: COUNT_PIECES)
    pieceStartLocations = [Int](repeating: -1, count: COUNT_PIECES)
    var p = 0
    var y = 0
    for l in lines {
      if l.isEmpty {
        continue
      }
      var x = 0
      var foundPiece = false
      for c in l {
        x += 1
        //   x : 3 : 5 : 7 : 9
        //   x : 0 : 2 : 4 : 6 : -3
        //   x : 0 : 1 : 2 : 3 : /2
        // loc : 7 : 8 : 9 : 10
        // loc += y * 4
        let loc = 7 + (x - 3) / 2 + y * 4
        if c == "A" || c == "B" || c == "C" || c == "D" {
          pieceStartLocations[p] = loc
          let piece = Int(c.asciiValue!) - 65
          var pieceCost = 1
          for _ in 0..<piece {
            pieceCost *= 10
          }
          pieceTypes[p] = piece + 1
          pieceCosts[p] = pieceCost
          foundPiece = true
          p += 1
        }
      }
      if foundPiece {
        y += 1
      }
    }
  }
  
  func Prepare(part1:Bool) {
    if part1 {
      // Add 8 extra pieces in the correct place
      pieceStartLocations[8] = 7 + 4 + 4
      pieceStartLocations[9] = 8 + 4 + 4
      pieceStartLocations[10] = 9 + 4 + 4
      pieceStartLocations[11] = 10 + 4 + 4
      
      pieceStartLocations[12] = 7 + 4 + 4 + 4
      pieceStartLocations[13] = 8 + 4 + 4 + 4
      pieceStartLocations[14] = 9 + 4 + 4 + 4
      pieceStartLocations[15] = 10 + 4 + 4 + 4
      
      pieceTypes[8] = 1
      pieceTypes[9] = 2
      pieceTypes[10] = 3
      pieceTypes[11] = 4
      
      pieceTypes[12] = 1
      pieceTypes[13] = 2
      pieceTypes[14] = 3
      pieceTypes[15] = 4
      
      pieceCosts[8] = 1
      pieceCosts[9] = 10
      pieceCosts[10] = 100
      pieceCosts[11] = 1000
      
      pieceCosts[12] = 1
      pieceCosts[13] = 10
      pieceCosts[14] = 100
      pieceCosts[15] = 1000
    }
    else {
      // Part2
      pieceStartLocations[4] += 8
      pieceStartLocations[5] += 8
      pieceStartLocations[6] += 8
      pieceStartLocations[7] += 8
      
      pieceStartLocations[8] = 7 + 4
      pieceStartLocations[9] = 8 + 4
      pieceStartLocations[10] = 9 + 4
      pieceStartLocations[11] = 10 + 4
      
      pieceStartLocations[12] = 7 + 4 + 4
      pieceStartLocations[13] = 8 + 4 + 4
      pieceStartLocations[14] = 9 + 4 + 4
      pieceStartLocations[15] = 10 + 4 + 4
      
      // Add 8 extra pieces in between top and bottom row
      
      // #D#C#B#A#
      pieceTypes[8] = 4
      pieceTypes[9] = 3
      pieceTypes[10] = 2
      pieceTypes[11] = 1
      
      // #D#B#A#C#
      pieceTypes[12] = 4
      pieceTypes[13] = 2
      pieceTypes[14] = 1
      pieceTypes[15] = 3
      
      pieceCosts[8] = 1000
      pieceCosts[9] = 100
      pieceCosts[10] = 10
      pieceCosts[11] = 1
      
      pieceCosts[12] = 1000
      pieceCosts[13] = 10
      pieceCosts[14] = 1
      pieceCosts[15] = 100
    }
    
    locationTypes = [Int](repeating: 0, count: COUNT_LOCATIONS)
    // 0-1-+-2-+-3-+-4-+-5-6
    //     |   |   |   |
    //     7   8   9  10
    //     |   |   |   |
    //    11  12  13  14
    //     |   |   |   |
    //    15  16  17  18
    //     |   |   |   |
    //    19  20  21  22
    for i in 0...6 {
      locationTypes[i] = 0
    }
    for i in 1...4 {
      locationTypes[i+6] = i
      locationTypes[i+10] = i
      locationTypes[i+14] = i
      locationTypes[i+18] = i
    }
    moveCosts = [[Int]](repeating: [], count: COUNT_LOCATIONS)
    for from in 0..<COUNT_LOCATIONS {
      moveCosts[from] = [Int](repeating: 0, count: COUNT_LOCATIONS)
      for to in 0..<COUNT_LOCATIONS {
        moveCosts[from][to] = ComputeMoveCost(from: from, to: to)
      }
    }
    nextMoveSpot = [[Int]](repeating: [], count: COUNT_LOCATIONS)
    for from in 0..<COUNT_LOCATIONS {
      nextMoveSpot[from] = [Int](repeating: -1, count: COUNT_LOCATIONS)
      for to in 0..<COUNT_LOCATIONS {
        nextMoveSpot[from][to] = ComputeNextMoveSpot(from: from, to: to)
        assert(nextMoveSpot[from][to] != from)
      }
    }
    for from in 0..<COUNT_LOCATIONS {
      for to in 0..<COUNT_LOCATIONS {
        var loc = from
        var moveCost = 0
        while loc != to {
          let newLoc = nextMoveSpot[loc][to]
          assert(newLoc != -1)
          moveCost += 1
          loc = newLoc
          assert(moveCost < 100)
        }
      }
    }
    pieceLocations = pieceStartLocations
    states = [Int](repeating: 0, count: COUNT_LOCATIONS)
    for p in 0..<COUNT_PIECES {
      let location = pieceLocations[p]
      states[location] = pieceTypes[p]
    }
  }
  
  func ComputeNextMoveSpot(from: Int, to: Int) -> Int {
    if from == to {
      return -1
    }
    // 0-1-+-2-+-3-+-4-+-5-6
    //     |   |   |   |
    //     7   8   9  10
    //     |   |   |   |
    //    11  12  13  14
    //     |   |   |   |
    //    15  16  17  18
    //     |   |   |   |
    //    19  20  21  22
    if from == 0 {
      return 1
    }
    if from == 6 {
      return 5
    }
    if from >= 19 && from <= 22 {
      return from - 4
    }
    if from >= 15 && from <= 18 {
      if to == from + 4 {
        return from + 4
      }
      return from - 4
    }
    if from >= 11 && from <= 14 {
      if to == from + 4 || to == from + 8 {
        return from + 4
      }
      return from - 4
    }
    if from >= 7 && from <= 10 {
      if to == from + 4 || to == from + 8 || to == from + 12 {
        return from + 4
      }
      if to <= from - 6 {
        return from - 6
      }
      return from - 5
    }
    // from : 1...5
    if to < from {
      return from - 1
    }
    if to <= 6 {
      return from + 1
    }
    let typeTo = locationTypes[to]
    // Room 1
    if typeTo == 1 {
      if from == 1 || from == 2 {
        return 7
      }
      //3,4,5
      return from - 1
    }
    // Room 2
    if typeTo == 2 {
      if from == 2 || from == 3 {
        return 8
      }
      //1,4,5
      if from < 2 {
        return from + 1
      }
      return from - 1
    }
    // Room 3
    if typeTo == 3 {
      if from == 3 || from == 4 {
        return 9
      }
      // 1,2,5
      if from < 3 {
        return from + 1
      }
      return from - 1
    }
    // Room 4
    if typeTo == 4 {
      if from == 4 || from == 5 {
        return 10
      }
      // 1,2,3
      if from < 4 {
        return from + 1
      }
      assertionFailure()
      return from - 1
    }
    
    assertionFailure()
    return -1
  }
  
  func ComputeMoveCost(from:Int, to:Int) -> Int {
    if from == to {
      return 0
    }
    let typeFrom = locationTypes[from]
    let typeTo = locationTypes[to]
    if typeFrom == 0 {
      // Hallway -> Hallway is invalid
      if typeTo == 0 {
        return 0
      }
      // Hallway to Room
      // Find hallway above target Room
      // 0-1-+-2-+-3-+-4-+-5-6
      //     |   |   |   |
      //     7   8   9  10
      //     |   |   |   |
      //    11  12  13  14
      //     |   |   |   |
      //    15  16  17  18
      //     |   |   |   |
      //    19  20  21  22
      // Room 1
      if typeTo == 1 {
        var cost = 0
        if from <= 1 {
          cost = 3 - from
        }
        else if from >= 2 {
          cost += 2
          if from >= 3 {
            cost += 2
            if from >= 4 {
              cost += 2
              if from >= 5 {
                cost += 2 + (from - 5)
                assert(from <= 6)
              }
            }
          }
        }
        if to >= 11 {
          cost += (to - 7) / 4
        }
        return cost
      }
      // Room 2
      else if typeTo == 2 {
        var cost = 0
        if from <= 2 {
          cost += 2
          if from <= 1 {
            cost += 3 - from
          }
        }
        else if from >= 3 {
          cost += 2
          if from >= 4 {
            cost += 2
            if from >= 5 {
              cost += 2 + (from - 5)
            }
          }
        }
        if to >= 12 {
          cost += (to - 8) / 4
        }
        return cost
      }
      // Room 3
      else if typeTo == 3 {
        var cost = 0
        if from <= 3 {
          cost += 2
          if from <= 2 {
            cost += 2
            if from <= 1 {
              cost += 3 - from
            }
          }
        }
        else if from >= 4 {
          cost += 2
          if from >= 5 {
            cost += 2 + (from - 5)
          }
        }
        if to >= 13 {
          cost += (to - 9) / 4
        }
        return cost
      }
      // Room 4
      else if typeTo == 4 {
        var cost = 0
        if from <= 4 {
          cost += 2
          if from <= 3 {
            cost += 2
            if from <= 2 {
              cost += 2
              if from <= 1 {
                cost += 3 - from
              }
            }
          }
        }
        else if from >= 5 {
          if from >= 5 {
            cost += 2 + (from - 5)
          }
        }
        if to >= 14 {
          cost += (to - 10) / 4
        }
        return cost
      }
      assertionFailure()
    }
    if typeTo == 0 {
      return ComputeMoveCost(from: to, to: from)
    }
    // Room to Room
    // Find hallway above target Room
    // 0-1-+-2-+-3-+-4-+-5-6
    //     |   |   |   |
    //     7   8   9  10
    //     |   |   |   |
    //    11  12  13  14
    //     |   |   |   |
    //    15  16  17  18
    //     |   |   |   |
    //    19  20  21  22
    var hallpoint = -1
    // From Room 1
    if typeFrom == 1 {
      if typeTo == 2 {
        hallpoint = 2
      }
      else if typeTo == 3 {
        hallpoint = 3
      }
    }
    // From Room 2
    else if typeFrom == 2 {
      if typeTo == 3 {
        hallpoint = 3
      }
    }
    // From Room 3
    else if typeFrom == 3 {
      if typeTo == 2 {
        hallpoint = 3
      }
    }
    // From Room 4
    else if typeFrom == 4 {
      if typeTo == 2 {
        hallpoint = 3
      }
      else if typeTo == 3 {
        hallpoint = 4
      }
    }
    if typeTo == 1 {
      hallpoint = 2
    }
    else if typeTo == 4 {
      hallpoint = 4
    }
    // Same room to same room
    if typeFrom != typeTo {
      assert(hallpoint >= 2)
      assert(hallpoint <= 4)
      var cost = 0
      cost += ComputeMoveCost(from: from, to: hallpoint)
      cost += ComputeMoveCost(from: hallpoint, to: to)
      return cost
    }

    //     7   8   9  10
    //     |   |   |   |
    //    11  12  13  14
    //     |   |   |   |
    //    15  16  17  18
    //     |   |   |   |
    //    19  20  21  22
    let cost = abs(to-from) / 4
    assert(cost >= 1)
    assert(cost <= 3)
    return cost
  }
  
  func IsInvalidMove(from:Int, to:Int, p:Int, pieceType:Int) -> Bool {
    // Can only move to an empty space
    assert(states[to] == 0)
    
    let typeFrom = locationTypes[from]
    let typeTo = locationTypes[to]
    if typeFrom == 0 {
      // Hallway -> Room has to be the correct room
      if typeTo != pieceType {
        return true
      }
      // Move Hallway -> final room ONLY if final room only does not have wrong piece in it
      // Room can't have wrong piece in it
      // room0 = pieceType + 6
      // room1 = pieceType + 10
      let room0 = pieceType + 6
      let room1 = pieceType + 10
      for i in 0..<COUNT_PIECES {
        if i == p {
          continue
        }
        if pieceTypes[i] == pieceType {
          continue
        }
        // Not this piece and not the same type : not allowed in the same final room
        if pieceLocations[i] == room0 || pieceLocations[i] == room1 {
          return true
        }
      }
    }
    // Do not leave room if in the correct room and slot
    if pieceType == typeFrom {
      // Do not leave room first slot if in the correct room
      if from >= 7 && from <= 10 {
        if pieceType == typeFrom {
          if states[from+4] == pieceType && states[from+8] == pieceType && states[from+12] == pieceType {
            return true
          }
        }
      }
      // Do not leave room second slot if in the correct room
      if from >= 11 && from <= 14 {
        if states[from+4] == pieceType && states[from+8] == pieceType {
          return true
        }
      }
      // Do not leave room third slot if in the correct room
      if from >= 15 && from <= 18 {
        if states[from+4] == pieceType {
          return true
        }
      }
      // Do not leave room fourth slot if in the correct room
      if from >= 19 && from <= 22 {
        return true
      }
    }
    
    // Move Room -> Hallway or Room
    
    // Move -> Room
    if typeTo > 0 {
      // Do not move to a Room which is not the correct room
      if pieceType != typeTo {
        // print("WRONG ROOM \(pieceType) : \(from) -> \(to)")
        return true
      }
      // Only move to first room slot if below are correct
      if to >= 7 && to <= 10 {
        if states[to+4] != pieceType || states[to+8] != pieceType || states[to+12] != pieceType {
          return true
        }
      }
      if to >= 11 && to <= 14 {
        if states[to+4] != pieceType || states[to+8] != pieceType {
          return true
        }
      }
      if to >= 15 && to <= 18 {
        if states[to+4] != pieceType {
          return true
        }
      }
    }
    
    var loc = from
    var moveCost = 0
    while loc != to {
      let newLoc = nextMoveSpot[loc][to]
      assert(newLoc != -1)
      if states[newLoc] != 0 {
        return true
      }
      loc = newLoc
      moveCost += 1
      assert(moveCost < 100)
    }
    // print("VALID MOVE \(p):\(pieceType) : \(from) -> \(to)")
    return false
  }
  
  func IsComplete() -> Bool {
    for p in 0..<COUNT_PIECES {
      let pieceLocation = pieceLocations[p]
      let pieceLocationType = locationTypes[pieceLocation]
      let pieceType = pieceTypes[p]
      if pieceType != pieceLocationType {
        return false
      }
    }
    return true
  }
  
  func MinCostToComplete() -> Int {
    var cost = 0
    for p in 0..<COUNT_PIECES {
      let pieceLocation = pieceLocations[p]
      let pieceLocationType = locationTypes[pieceLocation]
      let pieceType = pieceTypes[p]
      if pieceType != pieceLocationType {
        let from = pieceLocation
        let to = pieceType + 6
        let pieceCost = pieceCosts[p]
        let moveCost = moveCosts[from][to]
        let deltaCost = moveCost * pieceCost
        cost += deltaCost
      }
    }
    return cost
  }
  
  func DoNextMove(cost:Int) {
    if cost > minCost {
      return
    }
    let minMoveCost = MinCostToComplete()
    if cost + minMoveCost >= minCost {
      return
    }

    for p in 0..<COUNT_PIECES {
      let start = pieceLocations[p]
      let pieceLocationType = locationTypes[start]
      let pieceType = pieceTypes[p]
      if pieceType == pieceLocationType {
        // Do not leave room fourth slot if in the correct room
        if start >= 19 && start <= 22 {
          continue
        }
        
        // Do not leave room third slot if in the correct room
        if start >= 15 && start <= 18 {
          if states[start+4] == pieceType {
            continue
          }
        }
        
        // Piece is in the correct room : check the slot
        if start >= 7 && start <= 10 {
          if states[start+4] == pieceType && states[start+8] == pieceType && states[start+12] == pieceType {
            continue
          }
        }
        // Do not leave room second slot if in the correct room
        if start >= 11 && start <= 14 {
          if states[start+4] == pieceType && states[start+8] == pieceType {
            continue
          }
        }
      }
      let pieceCost = pieceCosts[p]
      for destination in 0..<COUNT_LOCATIONS {
        // Can only move to an empty space
        if states[destination] > 0 {
          continue
        }
        let moveCost = moveCosts[start][destination]
        if moveCost == 0 {
          continue
        }
        assert(moveCost > 0)
        assert(moveCost < Int.max)
        let newCost = cost + moveCost * pieceCost
        if newCost > minCost {
          continue
        }
        
        if IsInvalidMove(from:start, to:destination, p:p, pieceType:pieceType) {
          continue
        }
        
        pieceLocations[p] = destination
        let minMoveCost = MinCostToComplete()
        if newCost + minMoveCost >= minCost {
          pieceLocations[p] = start
          continue
        }
        if IsComplete() {
          if newCost < minCost {
            // print("NEW BEST \(newCost)")
            minCost = newCost
            if cost > minCost {
              pieceLocations[p] = start
              return
            }
          }
        }
        else if newCost != minCost {
          states[start] = 0
          states[destination] = pieceType
          DoNextMove(cost:newCost)
          states[start] = pieceType
          states[destination] = 0
        }
        pieceLocations[p] = start
      }
    }
  }
  
  func Part1() -> Int {
    Prepare(part1:true)
    minCost = Int.max
    DoNextMove(cost: 0)
    return minCost
  }
  
  func Part2() -> Int {
    Prepare(part1:false)
    minCost = Int.max
    DoNextMove(cost: 0)
    return minCost
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

// 0-1-+-2-+-3-+-4-+-5-6
//     |   |   |   |
//     7   8   9  10
//     |   |   |   |
//    11  12  13  14

// Move Hallway -> final room ONLY if final room only does not have wrong piece in it
// Move Room -> Hallway
//
// IsHallway = location < 7
// NodeType[15] -> 0 [Hallway], 1, 2, 3, 4 Home Type
// Board[15] = 0 : Empty, 1,2,3,4 : Piece Type
//
// Piece A,B,C,D : Home 1, Home 2, Home 3, Home 4
// Piece Type = 1, 2, 3, 4
// Home = Type
// Cost[5] = 0, 1, 10, 100, 1000
// Piece : location
//
// A = 1 per step
// B = 10 per step
// C = 100 per step
// D = 1000 per step

/*
 ..+.+.+.+..
 ##B#C#B#D##
 #A#D#C#A#
 
 ..+B+.+.+..
 ##B#C#.#D##
 #A#D#C#A#
 
 ..+B+C+.+..
 ##B#C#.#D##
 #A#D#C#A#
 
 ..+B+.+.+..
 ##B#.#C#D##
 #A#D#C#A#
 
 ..+B+.+D+..
 ##B#.#C#.##
 #A#D#C#A#
 
 ..+B+D+D+..
 ##B#.#C#.##
 #A#.#C#A#
 
 ..+.+D+D+..
 ##B#.#C#.##
 #A#B#C#A#
 
 ..+B+D+D+..
 ##.#.#C#.##
 #A#B#C#A#
 
 ..+.+D+D+..
 ##.#B#C#.##
 #A#B#C#A#
 
 ..+.+D+D+A.
 ##.#B#C#.##
 #A#B#C#.#
 
 ..+.+D+.+A.
 ##.#B#C#.##
 #A#B#C#D#
 
 ..+.+.+.+A.
 ##.#B#C#D##
 #A#B#C#D#
 
 ..+.+.+.+..
 ##A#B#C#D##
 #A#B#C#D#
 
 */

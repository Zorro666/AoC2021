import Foundation

/*
 
 --- Day 18: Snailfish ---
 
 You descend into the ocean trench and encounter some snailfish. They say they saw the sleigh keys! They'll even tell you which direction the keys went if you help one of the smaller snailfish with his math homework.
 
 Snailfish numbers aren't like regular numbers. Instead, every snailfish number is a pair - an ordered list of two elements. Each element of the pair can be either a regular number or another pair.
 
 Pairs are written as [x,y], where x and y are the elements within the pair. Here are some example snailfish numbers, one snailfish number per line:
 
 [1,2]
 [[1,2],3]
 [9,[8,7]]
 [[1,9],[8,5]]
 [[[[1,2],[3,4]],[[5,6],[7,8]]],9]
 [[[9,[3,8]],[[0,9],6]],[[[3,7],[4,9]],3]]
 [[[[1,3],[5,3]],[[1,3],[8,7]]],[[[4,9],[6,9]],[[8,2],[7,3]]]]
 This snailfish homework is about addition. To add two snailfish numbers, form a pair from the left and right parameters of the addition operator. For example, [1,2] + [[3,4],5] becomes [[1,2],[[3,4],5]].
 
 There's only one problem: snailfish numbers must always be reduced, and the process of adding two snailfish numbers can result in snailfish numbers that need to be reduced.
 
 To reduce a snailfish number, you must repeatedly do the first action in this list that applies to the snailfish number:
 
 If any pair is nested inside four pairs, the leftmost such pair explodes.
 If any regular number is 10 or greater, the leftmost such regular number splits.
 Once no action in the above list applies, the snailfish number is reduced.
 
 During reduction, at most one action applies, after which the process returns to the top of the list of actions. For example, if split produces a pair that meets the explode criteria, that pair explodes before other splits occur.
 
 To explode a pair, the pair's left value is added to the first regular number to the left of the exploding pair (if any), and the pair's right value is added to the first regular number to the right of the exploding pair (if any). Exploding pairs will always consist of two regular numbers. Then, the entire exploding pair is replaced with the regular number 0.
 
 Here are some examples of a single explode action:
 
 [[[[[9,8],1],2],3],4] becomes [[[[0,9],2],3],4] (the 9 has no regular number to its left, so it is not added to any regular number).
 [7,[6,[5,[4,[3,2]]]]] becomes [7,[6,[5,[7,0]]]] (the 2 has no regular number to its right, and so it is not added to any regular number).
 [[6,[5,[4,[3,2]]]],1] becomes [[6,[5,[7,0]]],3].
 [[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]] becomes [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]] (the pair [3,2] is unaffected because the pair [7,3] is further to the left; [3,2] would explode on the next action).
 [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]] becomes [[3,[2,[8,0]]],[9,[5,[7,0]]]].
 To split a regular number, replace it with a pair; the left element of the pair should be the regular number divided by two and rounded down, while the right element of the pair should be the regular number divided by two and rounded up. For example, 10 becomes [5,5], 11 becomes [5,6], 12 becomes [6,6], and so on.
 
 Here is the process of finding the reduced result of [[[[4,3],4],4],[7,[[8,4],9]]] + [1,1]:
 
 after addition: [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
 after explode:  [[[[0,7],4],[7,[[8,4],9]]],[1,1]]
 after explode:  [[[[0,7],4],[15,[0,13]]],[1,1]]
 after split:    [[[[0,7],4],[[7,8],[0,13]]],[1,1]]
 after split:    [[[[0,7],4],[[7,8],[0,[6,7]]]],[1,1]]
 after explode:  [[[[0,7],4],[[7,8],[6,0]]],[8,1]]
 Once no reduce actions apply, the snailfish number that remains is the actual result of the addition operation: [[[[0,7],4],[[7,8],[6,0]]],[8,1]].
 
 The homework assignment involves adding up a list of snailfish numbers (your puzzle input). The snailfish numbers are each listed on a separate line. Add the first snailfish number and the second, then add that result and the third, then add that result and the fourth, and so on until all numbers in the list have been used once.
 
 For example, the final sum of this list is [[[[1,1],[2,2]],[3,3]],[4,4]]:
 
 [1,1]
 [2,2]
 [3,3]
 [4,4]
 The final sum of this list is [[[[3,0],[5,3]],[4,4]],[5,5]]:
 
 [1,1]
 [2,2]
 [3,3]
 [4,4]
 [5,5]
 The final sum of this list is [[[[5,0],[7,4]],[5,5]],[6,6]]:
 
 [1,1]
 [2,2]
 [3,3]
 [4,4]
 [5,5]
 [6,6]
 Here's a slightly larger example:
 
 [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
 [7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
 [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
 [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
 [7,[5,[[3,8],[1,4]]]]
 [[2,[2,2]],[8,[8,1]]]
 [2,9]
 [1,[[[9,3],9],[[9,0],[0,7]]]]
 [[[5,[7,4]],7],1]
 [[[[4,2],2],6],[8,7]]
 The final sum [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]] is found after adding up the above snailfish numbers:
 
 [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
 + [7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
 = [[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]
 
 [[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]
 + [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
 = [[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]
 
 [[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]
 + [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
 = [[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]
 
 [[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]
 + [7,[5,[[3,8],[1,4]]]]
 = [[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]
 
 [[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]
 + [[2,[2,2]],[8,[8,1]]]
 = [[[[6,6],[6,6]],[[6,0],[6,7]]],[[[7,7],[8,9]],[8,[8,1]]]]
 
 [[[[6,6],[6,6]],[[6,0],[6,7]]],[[[7,7],[8,9]],[8,[8,1]]]]
 + [2,9]
 = [[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]]
 
 [[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]]
 + [1,[[[9,3],9],[[9,0],[0,7]]]]
 = [[[[7,8],[6,7]],[[6,8],[0,8]]],[[[7,7],[5,0]],[[5,5],[5,6]]]]
 
 [[[[7,8],[6,7]],[[6,8],[0,8]]],[[[7,7],[5,0]],[[5,5],[5,6]]]]
 + [[[5,[7,4]],7],1]
 = [[[[7,7],[7,7]],[[8,7],[8,7]]],[[[7,0],[7,7]],9]]
 
 [[[[7,7],[7,7]],[[8,7],[8,7]]],[[[7,0],[7,7]],9]]
 + [[[[4,2],2],6],[8,7]]
 = [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]
 To check whether it's the right answer, the snailfish teacher only checks the magnitude of the final sum. The magnitude of a pair is 3 times the magnitude of its left element plus 2 times the magnitude of its right element. The magnitude of a regular number is just that number.
 
 For example, the magnitude of [9,1] is 3*9 + 2*1 = 29; the magnitude of [1,9] is 3*1 + 2*9 = 21. Magnitude calculations are recursive: the magnitude of [[9,1],[1,9]] is 3*29 + 2*21 = 129.
 
 Here are a few more magnitude examples:
 
 [[1,2],[[3,4],5]] becomes 143.
 [[[[0,7],4],[[7,8],[6,0]]],[8,1]] becomes 1384.
 [[[[1,1],[2,2]],[3,3]],[4,4]] becomes 445.
 [[[[3,0],[5,3]],[4,4]],[5,5]] becomes 791.
 [[[[5,0],[7,4]],[5,5]],[6,6]] becomes 1137.
 [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]] becomes 3488.
 So, given this example homework assignment:
 
 [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
 [[[5,[2,8]],4],[5,[[9,9],0]]]
 [6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
 [[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
 [[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
 [[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
 [[[[5,4],[7,7]],8],[[8,3],8]]
 [[9,3],[[9,9],[6,[4,9]]]]
 [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
 [[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
 The final sum is:
 
 [[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]
 The magnitude of this final sum is 4140.
 
 Add up all of the snailfish numbers from the homework assignment in the order they appear. What is the magnitude of the final sum?
 
 Your puzzle answer was 4173.
 
 --- Part Two ---
 
 You notice a second question on the back of the homework assignment:
 
 What is the largest magnitude you can get from adding only two of the snailfish numbers?
 
 Note that snailfish addition is not commutative - that is, x + y and y + x can produce different results.
 
 Again considering the last example homework assignment above:
 
 [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
 [[[5,[2,8]],4],[5,[[9,9],0]]]
 [6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
 [[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
 [[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
 [[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
 [[[[5,4],[7,7]],8],[[8,3],8]]
 [[9,3],[[9,9],[6,[4,9]]]]
 [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
 [[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
 The largest magnitude of the sum of any two snailfish numbers in this list is 3993. This is the magnitude of [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]] + [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]], which reduces to [[[[7,8],[6,6]],[[6,0],[7,7]]],[[[7,8],[8,8]],[[7,9],[0,6]]]].
 
 What is the largest magnitude of any sum of two different snailfish numbers from the homework assignment?
 */

class Day18
{
  let Token_Unknown = -1000
  let Token_LBracket = -2000
  let Token_RBracket = -3000
  let Token_Comma = -4000
  
  var tokens:[[Int]] = []
  
  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day18")
    Parse(lines:lines)
    
    if (part1)
    {
      let result = Part1()
      let expected = 4173
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day18 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 4706
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day18 Part2: \(result)")
    }
  }
  
  func IsValue(n:Int, index:Int) -> Bool {
    return tokens[n][index] >= 0
  }
  
  func Explode() -> Bool {
    let n = 0
    var depth = 0
    let tokenCount = tokens[n].count
    for i in 0..<tokenCount {
      let t = tokens[n][i]
      if t == Token_LBracket {
        depth += 1
        if depth >= 5 {
          if IsValue(n:n, index:i+1) &&
              Token_Comma == tokens[n][i+2] &&
              IsValue(n:n, index:i+3) &&
              Token_RBracket == tokens[n][i+4] {
            let lhs = tokens[n][i+1]
            let rhs = tokens[n][i+3]
            for j in 1..<i {
              let index = i-j
              if IsValue(n:n, index:index) {
                tokens[n][index] += lhs
                break
              }
            }
            for j in i+5..<tokenCount {
              if IsValue(n:n, index:j) {
                tokens[n][j] += rhs
                break
              }
            }
            // pair lhs : added to first regular value to the left
            // pair rhs : added to first regular value to the right
            // replace [lhs,rhs] with 0
            tokens[n][i+0] = 0
            tokens[n].remove(at: i+1)
            tokens[n].remove(at: i+1)
            tokens[n].remove(at: i+1)
            tokens[n].remove(at: i+1)
            return true
          }
        }
      }
      else if t == Token_RBracket {
        depth -= 1
      }
    }
    return false
  }
  
  func Split() -> Bool {
    let n = 0
    let tokenCount = tokens[n].count
    for i in 0..<tokenCount {
      let t = tokens[n][i]
      if t >= 10 {
        // replace v with [v/2,v+1/2]
        // token[i] = [
        // insert at i+1 : v/2
        // insert at i+2 : ,
        // insert at i+3 : v+1/2
        // insert at i+4 : ]
        tokens[n][i] = Token_LBracket
        tokens[n].insert(t/2, at: i+1)
        tokens[n].insert(Token_Comma, at: i+2)
        tokens[n].insert((t+1)/2, at: i+3)
        tokens[n].insert(Token_RBracket, at: i+4)
        return true
      }
    }
    return false
  }
  
  func Reduce() {
    var done = false
    while !done {
      done = true
      if Explode() {
        done = false
      }
      else if Split() {
        done = false
      }
    }
  }
  
  func GetString() -> String {
    let n = 0
    var result = ""
    let tokenCount = tokens[n].count
    for i in 0..<tokenCount {
      let token = tokens[n][i]
      if token == Token_LBracket {
        result += "["
      }
      else if token == Token_RBracket {
        result += "]"
      }
      else if token == Token_Comma {
        result += ","
      }
      else {
        assert(token >= 0 && token <= 9)
        result += String(token)
      }
    }
    return result
  }
  
  func Add(rhs:Int) {
    // Add = [ LHS , RHS ]
    tokens[0].insert(Token_LBracket, at:0)
    tokens[0].append(Token_Comma)
    tokens[0].append(contentsOf:tokens[rhs])
    tokens[0].append(Token_RBracket)
  }
  
  func Parse(lines:[String]) {
    tokens = []
    var n = 0
    for l in lines {
      if l.isEmpty {
        continue
      }
      tokens.append([])
      for c in l {
        var token = Token_Unknown
        if c == "[" {
          token = Token_LBracket
        }
        else if c == "]" {
          token = Token_RBracket
        }
        else if c == "," {
          token = Token_Comma
        }
        else {
          token = Int(c.asciiValue! - 48)
        }
        tokens[n].append(token)
      }
      n += 1
    }
  }
  
  func MagnitudeRecursive(index:inout Int) -> Int {
    let n = 0
    var t = tokens[n][index]
    var lhs = 0
    var rhs = 0
    if t == Token_LBracket {
      index += 1
      lhs = MagnitudeRecursive(index: &index)
      t = tokens[n][index]
      assert(t == Token_Comma)
      index += 1
      rhs = MagnitudeRecursive(index: &index)
      t = tokens[n][index]
      assert(t == Token_RBracket)
      index += 1
      return 3 * lhs + 2 * rhs
    }
    index += 1
    return t
  }
  
  func Magnitude() -> Int {
    var index = 0
    return MagnitudeRecursive(index:&index)
  }
  
  func Part1() -> Int {
    for n in 1..<tokens.count {
      Add(rhs:n)
      Reduce()
    }
    return Magnitude()
  }
  
  func Part2() -> Int {
    var maxValue = Int.min
    let startTokens = tokens
    let countTokens = tokens.count
    for i in 0..<countTokens {
      for j in 0..<countTokens {
        tokens[0] = startTokens[i]
        tokens[1] = startTokens[j]
        Add(rhs:1)
        Reduce()
        let mag = Magnitude()
        maxValue = max(maxValue, mag)
      }
    }
    return maxValue
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

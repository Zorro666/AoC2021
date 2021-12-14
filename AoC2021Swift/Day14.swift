import Foundation

/*

 --- Day 14: Extended Polymerization ---

 The incredible pressures at this depth are starting to put a strain on your submarine. The submarine has polymerization equipment that would produce suitable materials to reinforce the submarine, and the nearby volcanically-active caves should even have the necessary input elements in sufficient quantities.

 The submarine manual contains instructions for finding the optimal polymer formula; specifically, it offers a polymer template and a list of pair insertion rules (your puzzle input). You just need to work out what polymer would result after repeating the pair insertion process a few times.

 For example:

 NNCB

 CH -> B
 HH -> N
 CB -> H
 NH -> C
 HB -> C
 HC -> B
 HN -> C
 NN -> C
 BH -> H
 NC -> B
 NB -> B
 BN -> B
 BB -> N
 BC -> B
 CC -> N
 CN -> C
 The first line is the polymer template - this is the starting point of the process.

 The following section defines the pair insertion rules. A rule like AB -> C means that when elements A and B are immediately adjacent, element C should be inserted between them. These insertions all happen simultaneously.

 So, starting with the polymer template NNCB, the first step simultaneously considers all three pairs:

 The first pair (NN) matches the rule NN -> C, so element C is inserted between the first N and the second N.
 The second pair (NC) matches the rule NC -> B, so element B is inserted between the N and the C.
 The third pair (CB) matches the rule CB -> H, so element H is inserted between the C and the B.
 Note that these pairs overlap: the second element of one pair is the first element of the next pair. Also, because all pairs are considered simultaneously, inserted elements are not considered to be part of a pair until the next step.

 After the first step of this process, the polymer becomes NCNBCHB.

 Here are the results of a few steps using the above rules:

 Template:     NNCB
 After step 1: NCNBCHB
 After step 2: NBCCNBBBCBHCB
 After step 3: NBBBCNCCNBBNBNBBCHBHHBCHB
 After step 4: NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB
 This polymer grows quickly. After step 5, it has length 97; After step 10, it has length 3073. After step 10, B occurs 1749 times, C occurs 298 times, H occurs 191 times, and N occurs 865 times; taking the quantity of the most common element (B, 1749) and subtracting the quantity of the least common element (H, 161) produces 1749 - 161 = 1588.

 Apply 10 steps of pair insertion to the polymer template and find the most and least common elements in the result. What do you get if you take the quantity of the most common element and subtract the quantity of the least common element?

 Your puzzle answer was 2233.

 --- Part Two ---

 The resulting polymer isn't nearly strong enough to reinforce the submarine. You'll need to run more steps of the pair insertion process; a total of 40 steps should do it.

 In the above example, the most common element is B (occurring 2192039569602 times) and the least common element is H (occurring 3849876073 times); subtracting these produces 2188189693529.

 Apply 40 steps of pair insertion to the polymer template and find the most and least common elements in the result. What do you get if you take the quantity of the most common element and subtract the quantity of the least common element?
 
 */

class Day14
{
  let LETTER_OFFSET = 64
  let MAX_LETTER = 32
  let MAX_RULES = 32 * 32
  var start:[Int] = []
  var countRules = 0
  var match1Rules:[Int] = []
  var match2Rules:[Int] = []
  var matchRules:[Bool] = []
  var counts:[Int] = []

  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day14")
    Parse(lines:lines)
    
    if (part1)
    {
      let result = Part1()
      let expected = 2233
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day14 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 2884513602164
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day14 Part2: \(result)")
    }
  }
  
  func Parse(lines:[String]) {
    start = []
    matchRules = [Bool](repeating: false, count: MAX_RULES)
    match1Rules = [Int](repeating: 0, count: MAX_RULES)
    match2Rules = [Int](repeating: 0, count: MAX_RULES)
    // NNCB
    //
    // CH -> B
    var rules = false
    for l in lines {
      if l.isEmpty {
        continue
      }
      let buffer = l.trimmingCharacters(in: .whitespaces)
      if rules {
        let toks = buffer.components(separatedBy: "->")
        let match = toks[0].trimmingCharacters(in: .whitespaces)
        assert(match.count == 2)
        let match1 = Int(match.first!.asciiValue!) - LETTER_OFFSET
        let match2 = Int(match.last!.asciiValue!) - LETTER_OFFSET
        let matchValue = Int(match1) * MAX_LETTER + Int(match2)
        let insert = toks[1].trimmingCharacters(in: .whitespaces)
        assert(insert.count == 1)
        let insertValue = Int(insert.first!.asciiValue!) - LETTER_OFFSET

        assert(!matchRules[matchValue])
        matchRules[matchValue] = true
        // AB -> AX, XB
        match1Rules[matchValue] = Int(match1) * MAX_LETTER + Int(insertValue)
        match2Rules[matchValue] = Int(insertValue) * MAX_LETTER + Int(match2)
        countRules += 1
      }
      else {
        for c in buffer {
          let v = Int(c.asciiValue!) - LETTER_OFFSET
          start.append(v)
        }
        rules = true
      }
    }
  }

  // AB -> count(A) = 1
  // AB -> count(B) = 1
  // Match -> AX, XB : AX, XX, XB
  // Match -> AX -> AY YX
  // Match -> XX -> XZ ZX
  // Match -> XB -> X@ @B
  // AB -> count(X) = 2

  func PerformSteps(count:Int) -> Int {
    counts = [Int](repeating: 0, count: 32)
    var pairsCount = [Int](repeating: 0, count: MAX_RULES)
    for c in 0..<start.count-1 {
      let m1 = start[c]
      let m2 = start[c+1]
      let pair = m1 * 32 + m2
      pairsCount[pair] += 1
      counts[m1] += 1
    }
    counts[start.last!] += 1

    for _ in 0..<count {
      var newPairsCount = [Int](repeating: 0, count: MAX_RULES)
      for p in 0..<MAX_RULES {
        let pc = pairsCount[p]
        if pc == 0 {
          continue
        }
        var pair1 = 0
        if matchRules[p] {
          pair1 = match1Rules[p]
          let pair2 = match2Rules[p]
          newPairsCount[pair1] += pc
          newPairsCount[pair2] += pc
          // m1 * MAX_LETTER + m2
          //let l0 = pair1 / MAX_LETTER
          let l1 = pair1 % MAX_LETTER
          let l2 = pair2 / MAX_LETTER
          //let l3 = pair2 % MAX_LETTER
          assert(l1 == l2)
          counts[l1] += pc
        }
        else {
          pair1 = p
          newPairsCount[p] += pc
        }
      }
      pairsCount = newPairsCount
    }

//    var most = -1
//    var least = -1
    var mostCount = Int.min
    var leastCount = Int.max
    for i in 0..<MAX_LETTER {
      let v = counts[i]
      if v == 0 {
        continue
      }
      if v > mostCount {
        mostCount = v
//        most = i
      }
      if v < leastCount {
        leastCount = v
//        least = i
      }
    }
//    print(Character(UnicodeScalar(most+LETTER_OFFSET)!))
//    print(Character(UnicodeScalar(least+LETTER_OFFSET)!))

    return mostCount - leastCount
  }

  func Part1() -> Int {
    return PerformSteps(count:10)
  }

  func Part2() -> Int {
    return PerformSteps(count:40)
  }

  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

import Foundation

/*
 
 --- Day 24: Arithmetic Logic Unit ---

 Magic smoke starts leaking from the submarine's arithmetic logic unit (ALU). Without the ability to perform basic arithmetic and logic functions, the submarine can't produce cool patterns with its Christmas lights!

 It also can't navigate. Or run the oxygen system.

 Don't worry, though - you probably have enough oxygen left to give you enough time to build a new ALU.

 The ALU is a four-dimensional processing unit: it has integer variables w, x, y, and z. These variables all start with the value 0. The ALU also supports six instructions:

 inp a - Read an input value and write it to variable a.
 add a b - Add the value of a to the value of b, then store the result in variable a.
 mul a b - Multiply the value of a by the value of b, then store the result in variable a.
 div a b - Divide the value of a by the value of b, truncate the result to an integer, then store the result in variable a. (Here, "truncate" means to round the value toward zero.)
 mod a b - Divide the value of a by the value of b, then store the remainder in variable a. (This is also called the modulo operation.)
 eql a b - If the value of a and b are equal, then store the value 1 in variable a. Otherwise, store the value 0 in variable a.
 In all of these instructions, a and b are placeholders; a will always be the variable where the result of the operation is stored (one of w, x, y, or z), while b can be either a variable or a number. Numbers can be positive or negative, but will always be integers.

 The ALU has no jump instructions; in an ALU program, every instruction is run exactly once in order from top to bottom. The program halts after the last instruction has finished executing.

 (Program authors should be especially cautious; attempting to execute div with b=0 or attempting to execute mod with a<0 or b<=0 will cause the program to crash and might even damage the ALU. These operations are never intended in any serious ALU program.)

 For example, here is an ALU program which takes an input number, negates it, and stores it in x:

 inp x
 mul x -1
 Here is an ALU program which takes two input numbers, then sets z to 1 if the second input number is three times larger than the first input number, or sets z to 0 otherwise:

 inp z
 inp x
 mul z 3
 eql z x
 Here is an ALU program which takes a non-negative integer as input, converts it into binary, and stores the lowest (1's) bit in z, the second-lowest (2's) bit in y, the third-lowest (4's) bit in x, and the fourth-lowest (8's) bit in w:

 inp w
 add z w
 mod z 2
 div w 2
 add y w
 mod y 2
 div w 2
 add x w
 mod x 2
 div w 2
 mod w 2
 Once you have built a replacement ALU, you can install it in the submarine, which will immediately resume what it was doing when the ALU failed: validating the submarine's model number. To do this, the ALU will run the MOdel Number Automatic Detector program (MONAD, your puzzle input).

 Submarine model numbers are always fourteen-digit numbers consisting only of digits 1 through 9. The digit 0 cannot appear in a model number.

 When MONAD checks a hypothetical fourteen-digit model number, it uses fourteen separate inp instructions, each expecting a single digit of the model number in order of most to least significant. (So, to check the model number 13579246899999, you would give 1 to the first inp instruction, 3 to the second inp instruction, 5 to the third inp instruction, and so on.) This means that when operating MONAD, each input instruction should only ever be given an integer value of at least 1 and at most 9.

 Then, after MONAD has finished running all of its instructions, it will indicate that the model number was valid by leaving a 0 in variable z. However, if the model number was invalid, it will leave some other non-zero value in z.

 MONAD imposes additional, mysterious restrictions on model numbers, and legend says the last copy of the MONAD documentation was eaten by a tanuki. You'll need to figure out what MONAD does some other way.

 To enable as many submarine features as possible, find the largest valid fourteen-digit model number that contains no 0 digits. What is the largest model number accepted by MONAD?

 */

class Day24
{
  var zDivides:[Int] = []
  var xAdds:[Int] = []
  var yAdds:[Int] = []

  let INSTRUCTION_INVALID = 0
  let INSTRUCTION_INPUT = 1
  let INSTRUCTION_ADD = 2
  let INSTRUCTION_MUL = 3
  let INSTRUCTION_DIV = 4
  let INSTRUCTION_MOD = 5
  let INSTRUCTION_EQL = 6

  let REGISTER_W = 0
  let REGISTER_X = 1
  let REGISTER_Y = 2
  let REGISTER_Z = 3
  let REGISTER_IMMEDIATE = 4
  let REGISTER_INVALID  = 5

  let COUNT_REGISTERS = 4
  let COUNT_BLOCKS = 14

  var registers:[Int] = []
  var instructions:[Int] = []
  var aOps:[Int] = []
  var bOps:[Int] = []
  var immediates:[Int] = []

  var blockStarts:[Int] = []

  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day24")
    Parse(lines:lines)

    if (part1)
    {
      let result = Part1()
      let expected = 91897399498995
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day24 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 51121176121391
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day24 Part2: \(result)")
    }
  }
  
  func GetRegister(op:String) -> Int {
    assert(op.count > 0)
    if op == "w" {
      return REGISTER_W
    }
    else if op == "x" {
      return REGISTER_X
    }
    else if op == "y" {
      return REGISTER_Y
    }
    else if op == "z" {
      return REGISTER_Z
    }
    return REGISTER_IMMEDIATE
  }

  func Parse(lines:[String]) {
    zDivides = [Int](repeating: 0, count: 14)
    xAdds = [Int](repeating: 0, count: 14)
    yAdds = [Int](repeating: 0, count: 14)
    var i = -1
    var searchState = 0
    var pc = 0
    for l in lines {
      if l.isEmpty {
        continue
      }
      let toks = l.components(separatedBy: .whitespaces)
      var inst = INSTRUCTION_INVALID
      let aOp = GetRegister(op: toks[1])
      let bOp = toks.count > 2 ? GetRegister(op: toks[2]) : REGISTER_INVALID
      let imm = bOp == REGISTER_IMMEDIATE ? Int(toks[2])! : 0

      if toks[0] == "inp" {
        inst = INSTRUCTION_INPUT
        blockStarts.append(pc)
      }
      else if toks[0] == "add" {
        inst = INSTRUCTION_ADD
      }
      else if toks[0] == "mul" {
        inst = INSTRUCTION_MUL
      }
      else if toks[0] == "div" {
        inst = INSTRUCTION_DIV
      }
      else if toks[0] == "mod" {
        inst = INSTRUCTION_MOD
      }
      else if toks[0] == "eql" {
        inst = INSTRUCTION_EQL
      }
      instructions.append(inst)
      aOps.append(aOp)
      bOps.append(bOp)
      immediates.append(imm)
      pc += 1

      if searchState == 0 {
        if l.starts(with: "inp w") {
          i += 1
          searchState = 1
          continue
        }
      }
      else if searchState == 1 {
        if l.starts(with: "div z") {
          let v = Int(toks[2])!
          zDivides[i] = v
          searchState = 2
          continue
        }
      }
      else if searchState == 2 {
        if l.starts(with: "add x") {
          let v = Int(toks[2])!
          searchState = 3
          xAdds[i] = v
          continue
        }
      }
      else if searchState == 3 {
        if l.starts(with: "add y w") {
          searchState = 4
          continue
        }
      }
      else if searchState == 4 {
        if l.starts(with: "add y") {
          let v = Int(toks[2])!
          yAdds[i] = v
          searchState = 0
          continue
        }
      }
    }
    blockStarts.append(pc)
    ClearRegisters()
  }

  func ClearRegisters() {
    registers = [Int](repeating: 0, count: COUNT_REGISTERS)
  }

  // Reverse of a block returns possible inZ values
  func UndoBlock(block:Int, outZ:Int, input:Int) -> [Int] {
    let xAdd = xAdds[block]
    let yAdd = yAdds[block]
    let zDivide = zDivides[block]
    var zIns:[Int] = []
    /*
     let z = inZ / zDivide
     if input == inZ % 26 + xAdd {
     return z
     }
     else {
     return 26 * z + input + yAdd
     }
     */

    /*
     Solve for inZ
     zDivide is 1 or 26
     when zDivide = 1, xAdd >= 10, input = 1...9
     therefore zDivide must b 26 for this if statement to be true

     outZ = inZ / zDivide
     if input == outZ % 26 + xAdd
     outZ = inZ / zDivide

     input - xAdd == outZ % 26
     temp = input - xAdd
     if temp in 0...25
     temp is the remainder of inZ after divide by 26
     outZ is the integer after divide by 26
     inZ = outZ * zDivide + temp

     */
    let temp1 = input - xAdd
    if 0 <= temp1 && temp1 <= 25 {
      if zDivide != 26 {
        fatalError("Bad zDivide \(zDivide)")
      }
      let inZ = outZ * zDivide + temp1
      zIns.append(inZ)
    }

    /*
     Solve for inZ
     outZ = 26 * inZ/zDivide + input + yAdd
     outZ - input - yAdd = 26 * inZ/zDivide
     temp = outZ - input - yAdd
     temp has to be a multiple of 26
     */
    let temp2 = outZ - input - yAdd
    if temp2 % 26 == 0 {
      let inZ = ( temp2 / 26 ) * zDivide
      zIns.append(inZ)
    }
    return zIns
  }

  // Each block of 14 does this
  func BlockOutput(block:Int, inZ:Int, input:Int) -> Int {
    let xAdd = xAdds[block]
    let yAdd = yAdds[block]
    let zDivide = zDivides[block]
    let z = inZ / zDivide
    if input == inZ % 26 + xAdd {
      return z
    }
    else {
      return 26 * z + input + yAdd
    }
  }

  func ExecuteInstruction(pc:Int, input:Int) -> Bool {
    let inst = instructions[pc]
    let aOp = aOps[pc]
    let bOp = bOps[pc]
    let imm = immediates[pc]
    if inst == INSTRUCTION_INPUT {
      registers[aOp] = input
      return true
    }
    let value = bOp == REGISTER_IMMEDIATE ? imm : registers[bOp]
    if inst == INSTRUCTION_ADD {
      registers[aOp] += value
    }
    else if inst == INSTRUCTION_MUL {
      registers[aOp] *= value
    }
    else if inst == INSTRUCTION_DIV {
      registers[aOp] /= value
    }
    else if inst == INSTRUCTION_MOD {
      registers[aOp] %= value
    }
    else if inst == INSTRUCTION_EQL {
      registers[aOp] = registers[aOp] == value ? 1 : 0
    }
    else {
      assertionFailure()
    }
    return false
  }

  func RunProgram(inputs:[Int]) -> Int {
    var i = 0
    var input = inputs[i]
    i += 1
    ClearRegisters()
    for pc in 0..<instructions.count {
      if ExecuteInstruction(pc: pc, input: input) {
        if i < inputs.count {
          input = inputs[i]
          i += 1
        }
      }
    }
    return registers[REGISTER_Z]
  }

  func RunBlock(block:Int, z:Int, input:Int) -> Int {
    let zGuess = BlockOutput(block:block, inZ:z, input:input)
    /*
     ClearRegisters()
     registers[REGISTER_Z] = z
     let start = blockStarts[block]
     let end = blockStarts[block+1]
     for pc in start..<end {
     _ = ExecuteInstruction(pc: pc, input: input)
     }
     let zReal = registers[REGISTER_Z]
     if zReal != zGuess {
     fatalError("No Match \(zReal) != \(zGuess)")
     }
     */
    return zGuess
  }

  func Pow10(exp:Int) -> Int {
    var v = 1
    for _ in 0..<exp {
      v *= 10
    }
    return v
  }

  func SolveBlock(block:Int, zOuts:[Int], inValues:[Int], outValues:inout [Int]) -> [Int] {
    var zIns:[Int] = []
    assert(zOuts.count == inValues.count)
    for i in 0..<zOuts.count {
      let inValue = inValues[i]
      let zOut = zOuts[i]
      for input in 1...9 {
        let tryZs = UndoBlock(block:block, outZ:zOut, input:input)
        /*
        for tryZ in tryZs {
          let z = RunBlock(block: block, z: tryZ, input: input)
          if z != zOut {
            fatalError("Bad tryZ \(tryZ)")
          }
        }
        */
        for z in tryZs {
          zIns.append(z)
          let v = input * Pow10(exp: 13 - block) + inValue
          outValues.append(v)
        }
      }
    }
    // print("\(block) : \(zIns.count)")
    return zIns
  }

  func Solve() -> [Int] {
    var zOuts:[Int] = []
    zOuts.append(0)
    var vals:[Int] = []
    vals.append(0)
    for b in 0...13 {
      let inVals = vals
      vals = []
      zOuts = SolveBlock(block: 13 - b, zOuts: zOuts, inValues: inVals, outValues:&vals)
    }
    assert(0 == zOuts.last)
    // print("\(zOuts.last) => \(vals.last)"
    return vals
  }

  func Part1() -> Int {
    let inputs = Solve()
    return inputs.last!
  }

  func Part2() -> Int {
    let inputs = Solve()
    return inputs.first!
  }

  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

/*

 div z 1
 add x 15
 add y 4

 div z 1
 add x 14
 add y 16

 div z 1
 add x 11
 add y 14

 div z 26
 add x -13
 add y 3

 div z 1
 add x 14
 add y 11

 div z 1
 add x 15
 add y 13

 div z 26
 add x -7
 add y 11

 div z 1
 add x 10
 add y 7

 div z 26
 add x -12
 add y 12

 div z 1
 add x 15
 add y 15

 div z 26
 add x -16
 add y 13

 div z 26
 add x -9
 add y 1

 div z 26
 add x -8
 add y 15

 div z 26
 add x -8
 add y 4

 */

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 15
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 4
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 14
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 16
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 11
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 14
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -13
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 3
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 14
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 11
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 15
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 13
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -7
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 11
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 10
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 7
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -12
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 12
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 1
//add x 15
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 15
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -16
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 13
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -9
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 1
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -8
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 15
//mul y x
//add z y

//inp w
//mul x 0
//add x z
//mod x 26
//div z 26
//add x -8
//eql x w
//eql x 0
//mul y 0
//add y 25
//mul y x
//add y 1
//mul z y
//mul y 0
//add y w
//add y 4
//mul y x
//add z y

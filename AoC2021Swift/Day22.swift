import Foundation

/*

 --- Day 22: Reactor Reboot ---

 Operating at these extreme ocean depths has overloaded the submarine's reactor; it needs to be rebooted.

 The reactor core is made up of a large 3-dimensional grid made up entirely of cubes, one cube per integer 3-dimensional coordinate (x,y,z). Each cube can be either on or off; at the start of the reboot process, they are all off. (Could it be an old model of a reactor you've seen before?)

 To reboot the reactor, you just need to set all of the cubes to either on or off by following a list of reboot steps (your puzzle input). Each step specifies a cuboid (the set of all cubes that have coordinates which fall within ranges for x, y, and z) and whether to turn all of the cubes in that cuboid on or off.

 For example, given these reboot steps:

 on x=10..12,y=10..12,z=10..12
 on x=11..13,y=11..13,z=11..13
 off x=9..11,y=9..11,z=9..11
 on x=10..10,y=10..10,z=10..10
 The first step (on x=10..12,y=10..12,z=10..12) turns on a 3x3x3 cuboid consisting of 27 cubes:

 10,10,10
 10,10,11
 10,10,12
 10,11,10
 10,11,11
 10,11,12
 10,12,10
 10,12,11
 10,12,12
 11,10,10
 11,10,11
 11,10,12
 11,11,10
 11,11,11
 11,11,12
 11,12,10
 11,12,11
 11,12,12
 12,10,10
 12,10,11
 12,10,12
 12,11,10
 12,11,11
 12,11,12
 12,12,10
 12,12,11
 12,12,12
 The second step (on x=11..13,y=11..13,z=11..13) turns on a 3x3x3 cuboid that overlaps with the first. As a result, only 19 additional cubes turn on; the rest are already on from the previous step:

 11,11,13
 11,12,13
 11,13,11
 11,13,12
 11,13,13
 12,11,13
 12,12,13
 12,13,11
 12,13,12
 12,13,13
 13,11,11
 13,11,12
 13,11,13
 13,12,11
 13,12,12
 13,12,13
 13,13,11
 13,13,12
 13,13,13
 The third step (off x=9..11,y=9..11,z=9..11) turns off a 3x3x3 cuboid that overlaps partially with some cubes that are on, ultimately turning off 8 cubes:

 10,10,10
 10,10,11
 10,11,10
 10,11,11
 11,10,10
 11,10,11
 11,11,10
 11,11,11
 The final step (on x=10..10,y=10..10,z=10..10) turns on a single cube, 10,10,10. After this last step, 39 cubes are on.

 The initialization procedure only uses cubes that have x, y, and z positions of at least -50 and at most 50. For now, ignore cubes outside this region.

 Here is a larger example:

 on x=-20..26,y=-36..17,z=-47..7
 on x=-20..33,y=-21..23,z=-26..28
 on x=-22..28,y=-29..23,z=-38..16
 on x=-46..7,y=-6..46,z=-50..-1
 on x=-49..1,y=-3..46,z=-24..28
 on x=2..47,y=-22..22,z=-23..27
 on x=-27..23,y=-28..26,z=-21..29
 on x=-39..5,y=-6..47,z=-3..44
 on x=-30..21,y=-8..43,z=-13..34
 on x=-22..26,y=-27..20,z=-29..19
 off x=-48..-32,y=26..41,z=-47..-37
 on x=-12..35,y=6..50,z=-50..-2
 off x=-48..-32,y=-32..-16,z=-15..-5
 on x=-18..26,y=-33..15,z=-7..46
 off x=-40..-22,y=-38..-28,z=23..41
 on x=-16..35,y=-41..10,z=-47..6
 off x=-32..-23,y=11..30,z=-14..3
 on x=-49..-5,y=-3..45,z=-29..18
 off x=18..30,y=-20..-8,z=-3..13
 on x=-41..9,y=-7..43,z=-33..15
 on x=-54112..-39298,y=-85059..-49293,z=-27449..7877
 on x=967..23432,y=45373..81175,z=27513..53682
 The last two steps are fully outside the initialization procedure area; all other steps are fully within it. After executing these steps in the initialization procedure region, 590784 cubes are on.

 Execute the reboot steps. Afterward, considering only cubes in the region x=-50..50,y=-50..50,z=-50..50, how many cubes are on?

 Your puzzle answer was 524792.

 --- Part Two ---

 Now that the initialization procedure is complete, you can reboot the reactor.

 Starting with all cubes off, run all of the reboot steps for all cubes in the reactor.

 Consider the following reboot steps:

 on x=-5..47,y=-31..22,z=-19..33
 on x=-44..5,y=-27..21,z=-14..35
 on x=-49..-1,y=-11..42,z=-10..38
 on x=-20..34,y=-40..6,z=-44..1
 off x=26..39,y=40..50,z=-2..11
 on x=-41..5,y=-41..6,z=-36..8
 off x=-43..-33,y=-45..-28,z=7..25
 on x=-33..15,y=-32..19,z=-34..11
 off x=35..47,y=-46..-34,z=-11..5
 on x=-14..36,y=-6..44,z=-16..29
 on x=-57795..-6158,y=29564..72030,z=20435..90618
 on x=36731..105352,y=-21140..28532,z=16094..90401
 on x=30999..107136,y=-53464..15513,z=8553..71215
 on x=13528..83982,y=-99403..-27377,z=-24141..23996
 on x=-72682..-12347,y=18159..111354,z=7391..80950
 on x=-1060..80757,y=-65301..-20884,z=-103788..-16709
 on x=-83015..-9461,y=-72160..-8347,z=-81239..-26856
 on x=-52752..22273,y=-49450..9096,z=54442..119054
 on x=-29982..40483,y=-108474..-28371,z=-24328..38471
 on x=-4958..62750,y=40422..118853,z=-7672..65583
 on x=55694..108686,y=-43367..46958,z=-26781..48729
 on x=-98497..-18186,y=-63569..3412,z=1232..88485
 on x=-726..56291,y=-62629..13224,z=18033..85226
 on x=-110886..-34664,y=-81338..-8658,z=8914..63723
 on x=-55829..24974,y=-16897..54165,z=-121762..-28058
 on x=-65152..-11147,y=22489..91432,z=-58782..1780
 on x=-120100..-32970,y=-46592..27473,z=-11695..61039
 on x=-18631..37533,y=-124565..-50804,z=-35667..28308
 on x=-57817..18248,y=49321..117703,z=5745..55881
 on x=14781..98692,y=-1341..70827,z=15753..70151
 on x=-34419..55919,y=-19626..40991,z=39015..114138
 on x=-60785..11593,y=-56135..2999,z=-95368..-26915
 on x=-32178..58085,y=17647..101866,z=-91405..-8878
 on x=-53655..12091,y=50097..105568,z=-75335..-4862
 on x=-111166..-40997,y=-71714..2688,z=5609..50954
 on x=-16602..70118,y=-98693..-44401,z=5197..76897
 on x=16383..101554,y=4615..83635,z=-44907..18747
 off x=-95822..-15171,y=-19987..48940,z=10804..104439
 on x=-89813..-14614,y=16069..88491,z=-3297..45228
 on x=41075..99376,y=-20427..49978,z=-52012..13762
 on x=-21330..50085,y=-17944..62733,z=-112280..-30197
 on x=-16478..35915,y=36008..118594,z=-7885..47086
 off x=-98156..-27851,y=-49952..43171,z=-99005..-8456
 off x=2032..69770,y=-71013..4824,z=7471..94418
 on x=43670..120875,y=-42068..12382,z=-24787..38892
 off x=37514..111226,y=-45862..25743,z=-16714..54663
 off x=25699..97951,y=-30668..59918,z=-15349..69697
 off x=-44271..17935,y=-9516..60759,z=49131..112598
 on x=-61695..-5813,y=40978..94975,z=8655..80240
 off x=-101086..-9439,y=-7088..67543,z=33935..83858
 off x=18020..114017,y=-48931..32606,z=21474..89843
 off x=-77139..10506,y=-89994..-18797,z=-80..59318
 off x=8476..79288,y=-75520..11602,z=-96624..-24783
 on x=-47488..-1262,y=24338..100707,z=16292..72967
 off x=-84341..13987,y=2429..92914,z=-90671..-1318
 off x=-37810..49457,y=-71013..-7894,z=-105357..-13188
 off x=-27365..46395,y=31009..98017,z=15428..76570
 off x=-70369..-16548,y=22648..78696,z=-1892..86821
 on x=-53470..21291,y=-120233..-33476,z=-44150..38147
 off x=-93533..-4276,y=-16170..68771,z=-104985..-24507
 After running the above reboot steps, 2758514936282235 cubes are on. (Just for fun, 474140 of those are also in the initialization procedure region.)

 Starting again with all cubes off, execute all reboot steps. Afterward, considering all cubes, how many cubes are on?
 */

class Day22
{
  let MIN_GRID = -50
  let MAX_GRID = +50

  var inValues:[UInt8] = []
  var inXmins:[Int] = []
  var inYmins:[Int] = []
  var inZmins:[Int] = []
  var inXmaxs:[Int] = []
  var inYmaxs:[Int] = []
  var inZmaxs:[Int] = []

  var nextXmins:[Int] = []
  var nextXmaxs:[Int] = []
  var nextYmins:[Int] = []
  var nextYmaxs:[Int] = []
  var nextZmins:[Int] = []
  var nextZmaxs:[Int] = []

  var outXmins:[Int] = []
  var outXmaxs:[Int] = []
  var outYmins:[Int] = []
  var outYmaxs:[Int] = []
  var outZmins:[Int] = []
  var outZmaxs:[Int] = []

  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day22")
    Parse(lines:lines)

    if (part1)
    {
      let result = Part1()
      let expected = 524792
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day22 Part1: \(result)")
    }
    else
    {
      let result = Part2()
      let expected = 1213461324555691
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day22 Part2: \(result)")
    }
  }
  
  func Parse(lines:[String]) {
    for l in lines {
      if l.isEmpty {
        continue
      }
      // on x=-49..-5,y=-3..45,z=-29..18
      var cubeValue:UInt8 = 0
      if l.starts(with: "on") {
        cubeValue = 1
      }
      else if l.starts(with: "off") {
        cubeValue = 0
      }
      else {
        assertionFailure()
      }
      // on x=-49..-5,y=-3..45,z=-29..18
      // split by '='
      // [0] = on x
      // [1] = -49..-5,y
      // [2] = -3..45,z
      // [3] = -29..18
      let equalToks = l.components(separatedBy: "=")
      var toks:[String] = []
      // split by '..'
      // [1] [0] = -49
      // [1] [1] = -5,y
      toks = equalToks[1].components(separatedBy: "..")
      let xMin = Int(toks[0])!
      let xMax = Int(toks[1].components(separatedBy: ",")[0])!
      // [2] [0] = -3
      // [2] [1] = 45,z
      toks = equalToks[2].components(separatedBy: "..")
      let yMin = Int(toks[0])!
      let yMax = Int(toks[1].components(separatedBy: ",")[0])!

      // [3] [0] = -29
      // [3] [1] = 18
      toks = equalToks[3].components(separatedBy: "..")
      let zMin = Int(toks[0])!
      let zMax = Int(toks[1])!

      assert(xMin <= xMax)
      assert(yMin <= yMax)
      assert(zMin <= zMax)

      inValues.append(cubeValue)
      inXmins.append(xMin)
      inXmaxs.append(xMax)
      inYmins.append(yMin)
      inYmaxs.append(yMax)
      inZmins.append(zMin)
      inZmaxs.append(zMax)
    }
  }

  func Subtract(cuboid:Int, from:Int) {
    let x0min = outXmins[from]
    let x0max = outXmaxs[from]
    let y0min = outYmins[from]
    let y0max = outYmaxs[from]
    let z0min = outZmins[from]
    let z0max = outZmaxs[from]

    let x1min = inXmins[cuboid]
    let x1max = inXmaxs[cuboid]
    let y1min = inYmins[cuboid]
    let y1max = inYmaxs[cuboid]
    let z1min = inZmins[cuboid]
    let z1max = inZmaxs[cuboid]
    // This takes cuboid 0 subtracts cuboid 1 from it
    // xyzImin = max(xyz0min, xyz1min)
    // xyzImax = min(xyz0max, xyz1max)
    let xImin = max(x0min, x1min)
    let xImax = min(x0max, x1max)
    let yImin = max(y0min, y1min)
    let yImax = min(y0max, y1max)
    let zImin = max(z0min, z1min)
    let zImax = min(z0max, z1max)

    // No overlap
    if xImin > xImax || yImin > yImax || zImin > zImax {
      AddCuboid(xMin: x0min, xMax: x0max, yMin: y0min, yMax: y0max, zMin: z0min, zMax: z0max)
      return
    }

    // x0min -> xImin-1, y0min -> y0max, z0min -> z0max
    if x0min < xImin {
      AddCuboid(xMin: x0min, xMax: xImin-1, yMin: y0min, yMax: y0max, zMin: z0min, zMax: z0max)
    }
    // xImax+1 -> x0max, y0min -> y0max, z0min -> z0max
    if xImax < x0max {
      AddCuboid(xMin: xImax+1, xMax: x0max, yMin: y0min, yMax: y0max, zMin: z0min, zMax: z0max)
    }
    // xImin -> xImax, y0min -> yImin-1, z0min -> z0max
    if y0min < yImin {
      AddCuboid(xMin: xImin, xMax: xImax, yMin: y0min, yMax: yImin-1, zMin: z0min, zMax: z0max)
    }
    // xImin -> xImax, yImax+1 -> y0max, z0min -> z0max
    if yImax < y0max {
      AddCuboid(xMin: xImin, xMax: xImax, yMin: yImax+1, yMax: y0max, zMin: z0min, zMax: z0max)
    }
    // xImin -> xImax, yImin -> yImax, z0min -> zImin-1
    if z0min < zImin {
      AddCuboid(xMin: xImin, xMax: xImax, yMin: yImin, yMax: yImax, zMin: z0min, zMax: zImin-1)
    }
    // xImin -> xImax, yImin -> yImax, zImax+1 -> z0max
    if zImax < z0max {
      AddCuboid(xMin: xImin, xMax: xImax, yMin: yImin, yMax: yImax, zMin: zImax+1, zMax: z0max)
    }
  }

  func AddCuboid(xMin:Int, xMax:Int, yMin:Int, yMax:Int, zMin:Int, zMax:Int) {
    assert(xMin <= xMax)
    assert(yMin <= yMax)
    assert(zMin <= zMax)
    nextXmins.append(xMin)
    nextXmaxs.append(xMax)
    nextYmins.append(yMin)
    nextYmaxs.append(yMax)
    nextZmins.append(zMin)
    nextZmaxs.append(zMax)
  }

  func Simplify(part1:Bool) {
    outXmins = []
    outXmaxs = []
    outYmins = []
    outYmaxs = []
    outZmins = []
    outZmaxs = []
    for i in 0..<inValues.count {
      nextXmins = []
      nextXmaxs = []
      nextYmins = []
      nextYmaxs = []
      nextZmins = []
      nextZmaxs = []
      let value = inValues[i]
      let xMin = inXmins[i]
      let xMax = inXmaxs[i]
      let yMin = inYmins[i]
      let yMax = inYmaxs[i]
      let zMin = inZmins[i]
      let zMax = inZmaxs[i]
      if part1 {
        if xMin < MIN_GRID || xMax > MAX_GRID || yMin < MIN_GRID || yMax > MAX_GRID || zMin < MIN_GRID || zMax > MAX_GRID {
          continue
        }
      }
      // subrtract from out arrays
      for j in 0..<outXmins.count {
        Subtract(cuboid:i, from:j)
      }
      // add to next arrays
      if value == 1 {
        AddCuboid(xMin:xMin, xMax:xMax, yMin:yMin, yMax:yMax, zMin:zMin, zMax:zMax)
      }
      // out arrays becomes next
      outXmins = nextXmins
      outXmaxs = nextXmaxs
      outYmins = nextYmins
      outYmaxs = nextYmaxs
      outZmins = nextZmins
      outZmaxs = nextZmaxs
    }
  }

  func CountOn() -> Int {
    var countOn = 0
    for i in 0..<outXmins.count {
      let xMin = outXmins[i]
      let xMax = outXmaxs[i]
      let yMin = outYmins[i]
      let yMax = outYmaxs[i]
      let zMin = outZmins[i]
      let zMax = outZmaxs[i]
      countOn += (zMax-zMin+1)*(yMax-yMin+1)*(xMax-xMin+1)
    }
    return countOn
  }

  func Part1() -> Int {
    Simplify(part1:true)
    return CountOn()
  }
  
  func Part2() -> Int {
    Simplify(part1:false)
    return CountOn()
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

/*

 z0Min -> z0Max
 y0Min -> y0Max
 x0Min -> x0Max

 z1Min -> z1Max
 y1Min -> y1Max
 x1Min -> x1Max

 In 3D ie. Cuboids

 #################
 #################
 #################

 #####******######
 #####******######
 #####******######
 #####******######
 #####******######

 #################
 #################

 This takes cuboid 0 subtracts cuboid 1 from it

 xyzImin = max(xyz0min, xyz1min)
 xyzImax = min(xyz0max, xyz1max)

 x0min -> xImin-1, y0min -> y0max, z0min -> z0max
 xImax+1 -> x0max, y0min -> y0max, z0min -> z0max
 xImin -> xImax, y0min -> yImin-1, z0min -> z0max
 xImin -> xImax, yImax+1 -> y0max, z0min -> z0max
 xImin -> xImax, yImin -> yImax, z0min -> zImin-1
 xImin -> xImax, yImin -> yImax, zImax+1 -> z0max

 Then add cuboid 1 if it is an on cubdoid
 */

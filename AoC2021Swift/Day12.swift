import Foundation

/*
 
 --- Day 12: Passage Pathing ---
 
 With your submarine's subterranean subsystems subsisting suboptimally, the only way you're getting out of this cave anytime soon is by finding a path yourself. Not just a path - the only way to know if you've found the best path is to find all of them.
 
 Fortunately, the sensors are still mostly working, and so you build a rough map of the remaining caves (your puzzle input). For example:
 
 start-A
 start-b
 A-c
 A-b
 b-d
 A-end
 b-end
 This is a list of how all of the caves are connected. You start in the cave named start, and your destination is the cave named end. An entry like b-d means that cave b is connected to cave d - that is, you can move between them.
 
 So, the above cave system looks roughly like this:
 
 start
 /   \
 c--A-----b--d
 \   /
 end
 Your goal is to find the number of distinct paths that start at start, end at end, and don't visit small caves more than once. There are two types of caves: big caves (written in uppercase, like A) and small caves (written in lowercase, like b). It would be a waste of time to visit any small cave more than once, but big caves are large enough that it might be worth visiting them multiple times. So, all paths you find should visit small caves at most once, and can visit big caves any number of times.
 
 Given these rules, there are 10 paths through this example cave system:
 
 start,A,b,A,c,A,end
 start,A,b,A,end
 start,A,b,end
 start,A,c,A,b,A,end
 start,A,c,A,b,end
 start,A,c,A,end
 start,A,end
 start,b,A,c,A,end
 start,b,A,end
 start,b,end
 (Each line in the above list corresponds to a single path; the caves visited by that path are listed in the order they are visited and separated by commas.)
 
 Note that in this cave system, cave d is never visited by any path: to do so, cave b would need to be visited twice (once on the way to cave d and a second time when returning from cave d), and since cave b is small, this is not allowed.
 
 Here is a slightly larger example:
 
 dc-end
 HN-start
 start-kj
 dc-start
 dc-HN
 LN-dc
 HN-end
 kj-sa
 kj-HN
 kj-dc
 The 19 paths through it are as follows:
 
 start,HN,dc,HN,end
 start,HN,dc,HN,kj,HN,end
 start,HN,dc,end
 start,HN,dc,kj,HN,end
 start,HN,end
 start,HN,kj,HN,dc,HN,end
 start,HN,kj,HN,dc,end
 start,HN,kj,HN,end
 start,HN,kj,dc,HN,end
 start,HN,kj,dc,end
 start,dc,HN,end
 start,dc,HN,kj,HN,end
 start,dc,end
 start,dc,kj,HN,end
 start,kj,HN,dc,HN,end
 start,kj,HN,dc,end
 start,kj,HN,end
 start,kj,dc,HN,end
 start,kj,dc,end
 Finally, this even larger example has 226 paths through it:
 
 fs-end
 he-DX
 fs-he
 start-DX
 pj-DX
 end-zg
 zg-sl
 zg-pj
 pj-he
 RW-he
 fs-DX
 pj-RW
 zg-RW
 start-pj
 he-WI
 zg-he
 pj-fs
 start-RW
 
 How many paths through this cave system are there that visit small caves at most once?
 
 Your puzzle answer was 3779.
 
 --- Part Two ---
 
 After reviewing the available paths, you realize you might have time to visit a single small cave twice. Specifically, big caves can be visited any number of times, a single small cave can be visited at most twice, and the remaining small caves can be visited at most once. However, the caves named start and end can only be visited exactly once each: once you leave the start cave, you may not return to it, and once you reach the end cave, the path must end immediately.
 
 Now, the 36 possible paths through the first example above are:
 
 start,A,b,A,b,A,c,A,end
 start,A,b,A,b,A,end
 start,A,b,A,b,end
 start,A,b,A,c,A,b,A,end
 start,A,b,A,c,A,b,end
 start,A,b,A,c,A,c,A,end
 start,A,b,A,c,A,end
 start,A,b,A,end
 start,A,b,d,b,A,c,A,end
 start,A,b,d,b,A,end
 start,A,b,d,b,end
 start,A,b,end
 start,A,c,A,b,A,b,A,end
 start,A,c,A,b,A,b,end
 start,A,c,A,b,A,c,A,end
 start,A,c,A,b,A,end
 start,A,c,A,b,d,b,A,end
 start,A,c,A,b,d,b,end
 start,A,c,A,b,end
 start,A,c,A,c,A,b,A,end
 start,A,c,A,c,A,b,end
 start,A,c,A,c,A,end
 start,A,c,A,end
 start,A,end
 start,b,A,b,A,c,A,end
 start,b,A,b,A,end
 start,b,A,b,end
 start,b,A,c,A,b,A,end
 start,b,A,c,A,b,end
 start,b,A,c,A,c,A,end
 start,b,A,c,A,end
 start,b,A,end
 start,b,d,b,A,c,A,end
 start,b,d,b,A,end
 start,b,d,b,end
 start,b,end
 The slightly larger example above now has 103 paths through it, and the even larger example now has 3509 paths through it.
 
 Given these new rules, how many paths through this cave system are there?
 
 */

class Day12
{
  let NODE_START:Int = 1
  let NODE_END:Int = 2
  let NODE_SMALL:Int = 3
  let NODE_LARGE:Int = 4
  let MAX_LINKS_PER_NODE = 8
  
  var countNodes:Int = 0
  var nodeTypes:[Int] = []
  var nodeNames:[String] = []
  var nodeCountLinks:[Int] = []
  var nodeLinks:[Int] = []
  var nodeMaxVisits:[Int] = []
  
  var startNodeIndex:Int = -1
  var endNodeIndex:Int = -1
  
  var routes:Set<String> = []
  
  func Execute(part1:Bool)
  {
    let lines = Program.ReadLines(day: "day12")
    
    if (part1)
    {
      let result = Part1(lines:lines)
      let expected = 3779
      if (result != expected)
      {
        fatalError("Part1 is broken expected \(expected) got \(result)")
      }
      print("Day12 Part1: \(result)")
    }
    else
    {
      let result = Part2(lines:lines)
      let expected = 96988
      if (result != expected)
      {
        fatalError("Part2 is broken expected \(expected) got \(result)")
      }
      print("Day12 Part2: \(result)")
    }
  }
  
  func FindOrAddNode(nodeName:String) -> Int {
    for i in 0..<countNodes {
      if nodeNames[i] == nodeName {
        return i
      }
    }
    let nodeIndex = countNodes
    
    nodeNames.append(nodeName)
    
    var nodeType:Int = 0
    if nodeName == "start" {
      nodeType = NODE_START
    }
    else if nodeName == "end" {
      nodeType = NODE_END
    }
    else if nodeName == nodeName.lowercased() {
      nodeType = NODE_SMALL
    }
    else {
      nodeType = NODE_LARGE
    }
    nodeTypes.append(nodeType)
    
    nodeCountLinks.append(0)
    for _ in 0..<MAX_LINKS_PER_NODE {
      nodeLinks.append(-1)
    }
    
    var maxVisits = 0
    if nodeType == NODE_START {
      assert(startNodeIndex == -1)
      startNodeIndex = nodeIndex
      maxVisits = 0
    }
    else if nodeType == NODE_END {
      assert(endNodeIndex == -1)
      endNodeIndex = nodeIndex
      maxVisits = 0
    }
    else if nodeType == NODE_SMALL {
      maxVisits = 0
    }
    else if nodeType == NODE_LARGE {
      maxVisits = Int.max
    }
    nodeMaxVisits.append(maxVisits)
    
    countNodes += 1
    return nodeIndex
  }
  
  func AddNodeLink(fromIndex:Int, toIndex:Int) {
    let countLinks = nodeCountLinks[fromIndex]
    nodeLinks[fromIndex*MAX_LINKS_PER_NODE+countLinks] = toIndex
    nodeCountLinks[fromIndex] += 1
  }
  
  func Parse(lines:[String]) {
    countNodes = 0
    nodeTypes = []
    nodeNames = []
    nodeCountLinks = []
    nodeLinks = []
    
    startNodeIndex = -1
    endNodeIndex = -1
    
    countNodes = 0
    for l in lines {
      if l.isEmpty {
        continue
      }
      // fs-end
      // start-DX
      // zg-pj
      // he-WI
      let toks = l.trimmingCharacters(in: .whitespaces).split(separator: "-")
      let nodeFrom = toks[0].trimmingCharacters(in: .whitespaces)
      let nodeTo = toks[1].trimmingCharacters(in: .whitespaces)
      
      let fromIndex = FindOrAddNode(nodeName: nodeFrom)
      let toIndex = FindOrAddNode(nodeName: nodeTo)
      AddNodeLink(fromIndex:fromIndex, toIndex:toIndex)
      AddNodeLink(fromIndex: toIndex, toIndex:fromIndex)
    }
  }
  
  func FindRoutes(from:Int, visitCount:inout [Int], route:inout String) {
    let countLinks = nodeCountLinks[from]
    for l in 0..<countLinks {
      let to = nodeLinks[from*MAX_LINKS_PER_NODE+l]
      if to == endNodeIndex {
        route += "-" + nodeNames[to]
        routes.update(with: route)
        continue
      }
      let toValid = visitCount[to] <= nodeMaxVisits[to]
      if toValid {
        var newVisitCount = visitCount
        newVisitCount[from] += 1
        var newRoute = route + "-" + nodeNames[to]
        FindRoutes(from: to, visitCount: &newVisitCount, route:&newRoute)
      }
    }
  }
  
  func Part1(lines:[String]) -> Int {
    Parse(lines:lines)
    routes = []
    var visitCount:[Int] = [Int](repeating: 0, count: countNodes)
    var route = nodeNames[startNodeIndex]
    FindRoutes(from:startNodeIndex, visitCount: &visitCount, route:&route)
    return routes.count
  }
  
  func Part2(lines:[String]) -> Int {
    Parse(lines:lines)
    routes = []
    for i in 0..<countNodes {
      if nodeTypes[i] == NODE_SMALL {
        var visitCount:[Int] = [Int](repeating: 0, count: countNodes)
        nodeMaxVisits[i] = 1
        var route = nodeNames[startNodeIndex]
        FindRoutes(from:startNodeIndex, visitCount: &visitCount, route:&route)
        nodeMaxVisits[i] = 0
      }
    }
    return routes.count
  }
  
  func Run()
  {
    Execute(part1: true)
    Execute(part1: false)
  }
}

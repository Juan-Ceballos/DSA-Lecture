//: [Previous](@previous)

import Foundation

struct Edge {
  var source: Int
  var destination: Int
  var weight: Int? = nil
}

struct Node {
  var value: Int
  var weight: Int? = nil
}

struct Graph {
  private var adjList: [[Node]]
  
  init(edges: [Edge]) {
    self.adjList = Array(repeating: [Node](), count: edges.count)
    
    for edge in edges {
      let destinationNode = Node(value: edge.destination)
      
      adjList[edge.source].append(destinationNode)
    }
  }
}

/*
 start at the source node
 create a stack
 create a visited set
 add the souce node to the stack
 add the source to visited nodes
 iterate through the stack while it's not empty
   pop the source from the stack
   print the source
   iterate through the source's neighbours
     if the the neighbour has not been marked visited
       push neighbor onto the stack
       mark neighbor visited
 
 0-----------1
 |           |
 |           |
 |           |
 |           |
 3-----------2

 // 0 3 2 1
 */

// dfs from a source node in a graph
extension Graph {
    func dfs(source: Int) {
        // create a stack
        var stack = [Int]()
        // create a visited set
        // will mark our nodes that have been seen
        var visited: Set<Int> = []
        
        // add the source node to the stack
        stack.append(source)
        // add source node to visited set
        visited.insert(source)
        // iterate through stack while it's not empty
        while !stack.isEmpty {
            
            // pop the top node
            let source = stack.removeLast()
            // pop last returns an optional int will return nil if item is not there
            // remove last returns int, will crash if nothing to remove
            // print the popped node
            print("\(source)", terminator: " ")
            /*
             |
             | 0 | -> [1, 3]
             |---
             */
            
            // iterate through the sources neighbours
            for node in adjList[source] {
                // check if neighbor has NOT been visited
                if !visited.contains(node.value) {
                    // if it has not been visited then add to the stack
                    stack.append(node.value)
                    // add to the visited set
                    visited.insert(node.value)
                }
                
            }
        }
        
    }
}

let edges = [
  Edge(source: 0, destination: 1),
  Edge(source: 0, destination: 3),
  
  Edge(source: 1, destination: 0),
  Edge(source: 1, destination: 2),
  
  Edge(source: 2, destination: 1),
  Edge(source: 2, destination: 3),
  
  Edge(source: 3, destination: 0),
  Edge(source: 3, destination: 2),
]

var graph = Graph(edges: edges)
//graph.dfs(source: 0)

// 0 3 2 1

// 2. performing DFS on a graph passed in as a matrix
let matrix = [
  [1, 2, 3, 4,],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]
]

func dfs(_ grid: [[Int]]) {
    // we need to modify grid to make a mutable copy
    // in dfs you always want to keep track of nodes or cells youve visited
    
    // two ways to keep track of visited nodes or cells
    // 1. visited array [[Bool]]
    // 2. mark the cell with an arbitrary value
    var grid = grid
    
    for row in 0 ..< grid.count {
        for col in 0 ..< grid[row].count {
            //print(grid[row][col], terminator: " ")
            
            // perform dfs on each cell
            dfsUtil(&grid, row, col)
        }
    }
}

func dfsUtil(_ grid: inout[[Int]], _ row: Int, _ col: Int) {
    // we need to set up boundaries for example:
    //    have we seen this cell before
    //    is the row within the limits of the array
    //    is the col within the limits of the array
    let height = grid.count // number of rows in grid
    let length = grid[0].count // number of elements in a row
    if row < 0 || col < 0 || row >= height || col >= length || grid[row][col] == 0 {
        return
    }
    print("\(grid[row][col])", terminator: " ")
    
    // mark the cell as visited
    grid[row][col] = 0
    
    // perform dfs on each direction in the grid recursively
    // to search for relevant values
    dfsUtil(&grid, row + 1, col)
    dfsUtil(&grid, row - 1, col)
    dfsUtil(&grid, row, col + 1)
    dfsUtil(&grid, row, col - 1)
    
}

dfs(matrix)

// revisit binary tree traversals - dfs, bfs
// challenge: number of islands (leet code 200)
// read up on disconnected and connected graphs


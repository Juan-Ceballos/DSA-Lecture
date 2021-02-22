import UIKit

/*

 0---------1
 |       / |  \
 |    /    |    \
 |  /      |    / 2
 |/        |  /
 4---------3/
 
   0 1 2 3 4
0: 0 1 0 0 1
1: 1 0 1 1 1
2: 0 1 0 1 0
3: 0 1 1 0 1
4: 1 1 0 1 0
 
*/


struct Graph {
    private var vertices: Int
    
    private var adjMatrix: [[Bool]]
    
    init(vertices: Int) {
        self.vertices = vertices
        
        // create our matrix
        self.adjMatrix = Array(repeating: Array(repeating: false, count: vertices), count: vertices)
        
        print(adjMatrix)
    }
    
    mutating func addEdge(source: Int, destination: Int) {
        // assuming is undirected, connected both ways
        adjMatrix[source][destination] = true
        adjMatrix[destination][source] = true
    }
    
    func printGraph() {
        var graphDescription = "   "
        
        for destIndex in 0..<vertices {
            graphDescription.append("\(destIndex) ")
        }
        graphDescription.append("\n")
        
        for sourceIndex in 0..<adjMatrix.count {
            graphDescription.append("\(sourceIndex): ")
            for hasConnection in adjMatrix[sourceIndex] {
                graphDescription.append(hasConnection ? "1" : "0")
                
                graphDescription.append(" ")
            }
            graphDescription.append("\n")
        }
        print(graphDescription)
    }
}

var graph = Graph(vertices: 5)

graph.addEdge(source: 0, destination: 1)
graph.addEdge(source: 0, destination: 4)

graph.addEdge(source: 1, destination: 2)
graph.addEdge(source: 1, destination: 3)
graph.addEdge(source: 1, destination: 4)

graph.addEdge(source: 2, destination: 3)

graph.addEdge(source: 3, destination: 4)

graph.printGraph()

//----------- Adjacency List -------------------

struct Edge {
    var source: Int // source node
    var destination: Int // destination node
    // var weight
}

struct Node {
    var value: Int
    // var weight
}

struct GraphList {
    private var adjList: [[Node]]
    
    init(edges: [Edge]) {
        // array of buckets e.g [[], [], ...]
        self.adjList = Array(repeating: [Node](), count: edges.count)
        
        // populate buckets with edges
        for edge in edges {
            let destinationNode = Node(value: edge.destination)
            adjList[edge.source].append(destinationNode)
            // source
            // adjList[0].append(1)
            // adjList[0].append(2)
            //
            /*
             index to inner array is source the inner array is array of destinations
             outer array is source array each index is an array of destinations
             
               0         1         2
             [[d1, d2], [d0, d2], [d0]]
             
             [[1, 2],
              [],
              []
             ]
             */
            
        }
    }
    
    // 0 ---> 1 0 ---> 4
    // 1 ---> 2
    func printGraph() {
        for sourceIndex in 0..<adjList.count {
            for edge in adjList[sourceIndex] {
                print("\(sourceIndex) ---> \(edge.value)", terminator: " ")
            }
            print()
        }
    }
}

let edges = [
  Edge(source: 0, destination: 1),
  Edge(source: 0, destination: 4),
  
  Edge(source: 1, destination: 0),
  Edge(source: 1, destination: 2),
  Edge(source: 1, destination: 4),
  Edge(source: 1, destination: 3),
  
  Edge(source: 2, destination: 1),
  Edge(source: 2, destination: 3),
  
  Edge(source: 3, destination: 1),
  Edge(source: 3, destination: 2),
  Edge(source: 3, destination: 4),

  Edge(source: 4, destination: 0),
  Edge(source: 4, destination: 1),
  Edge(source: 4, destination: 3),
]

var graphListStyle = GraphList(edges: edges)
graphListStyle.printGraph()

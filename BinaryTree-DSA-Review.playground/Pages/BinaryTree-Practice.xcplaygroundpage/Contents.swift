//: [Previous](@previous)

import Foundation

class BinaryTreeNode {
    let value: Int
    var leftChild : BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(value: Int, leftChild: BinaryTreeNode? = nil, rightChild: BinaryTreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func insert(_ root: BinaryTreeNode?, value: Int) -> BinaryTreeNode {
    let newNode = BinaryTreeNode(value: value)
    
    guard let root = root else {
        return newNode
    }
    
    if value < root.value {
        if root.leftChild == nil {
            root.leftChild = newNode
            return root
        } else {
            insert(root.leftChild, value: value)
        }
    }
    
    if value > root.value {
        if root.rightChild == nil {
            root.rightChild = newNode
            return root
        } else {
            insert(root.rightChild, value: value)
        }
    }
    
    return root
}

struct Queue<T> {
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.first
    }
    
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    
    public mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
}

extension BinaryTreeNode {
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
        var queue = Queue<BinaryTreeNode>()
        visit(self) // root node
        queue.enqueue(self) // queue now has node we visit
        
        while let node = queue.dequeue() {
            // node is now the node we are on, since on in queue
            // check for left child
            if let leftChild = node.leftChild {
                visit(leftChild)
                queue.enqueue(leftChild)
            }
            
            if let rightChild = node.rightChild {
                visit(rightChild)
                queue.enqueue(rightChild)
            }
        }
    }
}

let root = BinaryTreeNode(value: 9)
insert(root, value: 4)
insert(root, value: 12)
insert(root, value: 3)

print("breadth-first-traversal")
root.breadthFirstTraversal { (node) in
    print(node.value, terminator: " ")
}

print("\n")
// Depth First Traversal
extension BinaryTreeNode {
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        // reading left to right
        // 1 in order, 2 pre order, 3 post order
        // visit lc recursively -> visit current - > rc recursively
        
        leftChild?.inOrderTraversal(visit: visit) // call till nill
        visit(self) // visits current "root"
        rightChild?.inOrderTraversal(visit: visit)
    }
    
    func preOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        visit(self)
    }
    
    func postOderTraversal(visit: (BinaryTreeNode) -> ()) {
        
    }
}

root.inOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

//: [Previous](@previous)

import Foundation

struct Queue<T> {
    var items = [T]()
  
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var peak: T? {
        return items.last
    }
    
    mutating func enqueue(value: T) {
        items.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeFirst()
    }
}

class BinaryTreeNode {
    let value: Int
    var leftChild: BinaryTreeNode?
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
    
    if value <= root.value {
        if root.leftChild == nil {
            root.leftChild = newNode
            return root
        } else {
            insert(root.leftChild, value: value)
        }
    } else {
        if root.rightChild == nil {
            root.rightChild = newNode
            return root
        } else {
            insert(root.rightChild, value: value)
        }
    }
    
    return root
}

extension BinaryTreeNode {
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
        var queue = Queue<BinaryTreeNode>()
        visit(self)
        queue.enqueue(value: self)
        
        while let node = queue.dequeue() {
            if let leftChild = node.leftChild {
                visit(leftChild)
                queue.enqueue(value: leftChild)
            }
            
            if let rightChild = node.rightChild {
                visit(rightChild)
                queue.enqueue(value: rightChild)
            }
        }
    }
    
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        
    }
}


let node1 = BinaryTreeNode(value: 5)
let node2 = BinaryTreeNode(value: 3)
let node3 = BinaryTreeNode(value: 7)
let root = node1
root.leftChild = node2
root.rightChild = node3
print(root.value)
print(root.leftChild?.value ?? -999)
insert(root, value: 9)
print("BreadthFirstTraversal:")
root.breadthFirstTraversal { (visit) in
    print(visit.value)
}

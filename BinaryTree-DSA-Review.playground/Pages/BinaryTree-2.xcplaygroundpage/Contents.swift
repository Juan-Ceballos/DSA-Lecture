//: [Previous](@previous)

import Foundation

class BinaryTreeNode<T> {
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    let value: T
    
    init(value: T) {
        self.value = value
    }
}

func insert<T>(_ root: BinaryTreeNode<Int>?, value: T) -> BinaryTreeNode<Int> {
    let newNode = BinaryTreeNode<Int>(value: value as! Int)
    
    guard let root = root else {
        return newNode
    }
    
    if newNode.value <= root.value {
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

struct Queue<T> {
    var items = [T]()
    
    var isEmpty: Bool {
        return items.count != 0
    }
    
    mutating func enqueue(item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        if !items.isEmpty {
            return items.removeFirst()
        } else {
            return nil
        }
    }
    
}

extension BinaryTreeNode {
    func breadthFirstTraversal(_ visit: (BinaryTreeNode) -> ()) {
        var nodes = Queue<BinaryTreeNode>()
        visit(self)
        nodes.enqueue(item: self)
        
        while let node = nodes.dequeue() {
            if let leftChild = node.leftChild {
                visit(leftChild)
                nodes.enqueue(item: leftChild)
            }
            
            if let rightChild = node.rightChild {
                visit(rightChild)
                nodes.enqueue(item: rightChild)
            }
        }
        
    }
    
    func inOrderTraversal(_ visit: (BinaryTreeNode) -> ()) {
        leftChild?.inOrderTraversal(visit)
        visit(self)
        rightChild?.inOrderTraversal(visit)
    }
    
    
}

let root = BinaryTreeNode(value: 5)
insert(root, value: 3)
insert(root, value: 7)
insert(root, value: 9)

print("In Order Traversal")

root.inOrderTraversal { (visit) in
    print(visit.value, terminator: " ")
}

print("\n")
print("Breadth First Traversal")

root.breadthFirstTraversal { (visit) in
    print(visit.value, terminator: " ")
}

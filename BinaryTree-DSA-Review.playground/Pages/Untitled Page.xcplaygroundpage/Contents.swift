import UIKit

// class for tree node
class BinaryTreeNode {
    var value: Int
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
}

// insert
func insert(_ root: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode {
    // 1: create new node
    let newNode = BinaryTreeNode(value)
    
    // 2: if the root is empty new node becomes root
    guard let root = root else {
        return newNode
    }
    
    // 3: if value is less than roots value go left
    if value < root.value {
        if root.leftChild == nil {
            root.leftChild = newNode
            return root
        } else {
            insert(root.leftChild, value)
        }
    }
    
    // 4: if values is greater than roots value go right
    if value > root.value {
        if root.rightChild == nil {
            root.rightChild = newNode
            return root
        } else {
            insert(root.rightChild, value)
        }
    }
    
    return root
}

func inOrderTraversal(_ root: BinaryTreeNode?) {
    guard let root = root else {return}
    inOrderTraversal(root.leftChild)
    print(root.value, terminator: " ") // "\n" => " "
    inOrderTraversal(root.rightChild)
}

let rootNode = insert(nil, 3)
insert(rootNode, 2)
insert(rootNode, 5)
insert(rootNode, 4)
//insert(rootNode, 5)
//insert(rootNode, 11)
//insert(rootNode, 9)
//insert(rootNode, 16)

inOrderTraversal(rootNode)

//func search(_ root: BinaryTreeNode?, _ value: Int) -> Bool {
//    // check if tree is empty
//}

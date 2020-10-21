import UIKit

class Node<T> {
    var val: T
    var next: Node?
    
    init(val: T, next: Node? = nil) {
        self.val = val
        self.next = next
    }

}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(val) -> nil"
        }
        return "\(val) -> \(next)"
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // head first insertion
    mutating func push(_ val: T) {
        head = Node(val: val, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    // tail first insertion
    mutating func append(_ val: T) {
        // tail.next
        guard !isEmpty else {
            push(val)
            return
        }
        
        let newNode = Node(val: val)
        tail?.next = newNode
        tail = newNode
    }
    
    // remove head
    mutating func delete() -> T? {
        
        guard !isEmpty else {
            return nil
        }
        
        head = head?.next
        
        return nil
    }
    
    
}

extension LinkedList: CustomStringConvertible   {
    var description: String {
        guard let head = head
        else    {
            return "empty list"
        }
        return "\(head)"
    }
}

class Queue<T> {
    var list = LinkedList<T>()
    
    // fifo
    var front: T? {
        guard let frontList = list.head?.val else {
            return nil
        }
        
        return frontList
    }
    
    var back: T? {
        guard let backList = list.tail?.val else {
            return nil
        }
        
        return backList
    }
    
    func enqueue(_ val: T) {
        list.append(val)
    }
    
    func dequeue() -> T? {
        list.delete()
    }
    
}

extension Queue: CustomStringConvertible {
  public var description: String {
    String(describing: list)
  }
}

// test linked list implementation
var linkedList = LinkedList<Int>()
linkedList.push(3)
linkedList.append(4)
linkedList.append(5)
linkedList.push(2)
linkedList.delete()
linkedList.delete()
linkedList.delete()
linkedList.delete()
linkedList.append(3)
print(linkedList)

// test queue implemented with linked list
var queue = Queue<Int>()
queue.enqueue(0)
queue.enqueue(1)
queue.enqueue(2)
print(queue)
queue.dequeue()
queue.dequeue()
print(queue)
print(queue.front ?? -1)

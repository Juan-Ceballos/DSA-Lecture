import UIKit

// create a qeueu using a Linked list
struct Queue<T> {
    // properties
    private var elements: [T?] = []
    
    // head pointer to front of queue
    private var head = 0 // default
    
    public var count: Int {
        return elements.count - head
    }
    
    public var isEmpty: Bool {
        // return elements.isEmpty
        // to dequeue constant adjusting head and setting dequeued elements to nil
        return count == 0 // best representation of queue
    }
    
    public var front: T? {
        guard !isEmpty else {
            return nil
        }
        return elements[head]
    }
    
    // initializers
    
    // methods, func inside object
    
    public mutating func enqueue(_ element: T) {
        elements.append(element) // adds to back of the queue
    }
    
    public mutating func dequeue() -> T? {
        guard head < elements.count, let element = elements[head] else {
            return nil
        }
        
        elements[head] = nil
        head += 1
        
        // todo optimization to remove nil values
        let percentage = Double(head) / Double(elements.count)
        
        if elements.count > 20 && percentage > 0.25 {
            elements.removeFirst(head)
            head = 0          
        }
        
        return element
    }
}

import UIKit
/*
 Heap
 2         level 0
 /    \
 8      21.    level 1
 / \    /  \
 10  16  30   36 level 2
 func getMin() -> {} => O(1)
 
 
 Binary Tree
 10
 / \
 32  18
 \
 2
 func getMax() {} => O(n)
 
 
 Binary Search Tree
 16
 / \
 8  20
 /
 4
 func getMax() {} => O(log n)
 
 
 inorder: 10, 8, 16, 2, 30, 21, 36
 level order: 2, 8, 21, 10, 16, 30, 36
 */

// Heap - is a tree data structure that is mainly used to create a min Heap or max Heap
//        a Heap is traditionally implemented using an array as opposed to a Binary Tree
//        that uses pointers to left and right children.
//        The (Heap Property) is satisfied when for example in a min Heap the root is smaller than
//        any of its children, in a max Heap the root is greater than any child nodes


// Objective: create a Heap and be able to retrieve any parent or left and right child nodes


/*
 2 (0)
 /    \
 8(1)         21 (2)
 /    \          /  \
 10(3)  16(4)    30(5)   36(6)
 */


struct Heap {
    // data structure for our Heap nodes is an array
    private var nodes = [2, 8, 21, 10, 16, 30, 36]

    public var count: Int {
        return nodes.count
    }
    
    private var orderingCriteria: (Int, Int) -> Bool
    
    public init(_ sort: @escaping (Int, Int) -> Bool) {
        self.orderingCriteria = sort // < (min heap) , > (max heap)
    }
    
    public init(array: [Int], _ sort: @escaping (Int, Int) -> Bool) {
        self.orderingCriteria = sort
        convert(array: array)
    }
    
    // convert array to heap
    private mutating func convert(array: [Int]) {
        nodes = array
        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(from: i, to: nodes.count)
        }
    }
    
    // get the parent index
    public func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // get the left child index
    public func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    // get the right child index
    public func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    public func parent(_ index: Int) -> Int? {
        guard parentIndex(index) > 0 else { return nil }
        return nodes[parentIndex(index)] // return the parent index
    }
    
    public func leftChild(_ index: Int) -> Int? {
        guard leftChildIndex(index) < nodes.count else { return nil }
        return nodes[leftChildIndex(index)]
    }
    
    public func rightChild(_ index: Int) -> Int? {
        guard rightChildIndex(index) < nodes.count else { return nil }
        return nodes[rightChildIndex(index)]
    }
    
    // write a function called peek() to return the top value in the Heap
    func peek() -> Int? { // runtime => O(1)
        // guard !nodes.isEmpty else { return nil }
        // return nodes[0]
        return nodes.first // returns an optional
    }
    
    // insert
    
    /*
     2 [0]
     /    \
     8      21
     / \    /  \
     10  16  30   36
     /
     -6 [7]
     */
    public mutating func insert(_ item: Int) {
        // append new element to the end of the array
        nodes.append(item)
        shiftUp(nodes.count - 1) // pass in last index
    }
    
    // shift up in order to heapify the heap and safisfy the Heap Property
    private mutating func shiftUp(_ index: Int) {
        let child = nodes[index] // new element to be added
        var childIndex = index // starts off as the last index
        var parentIndex = self.parentIndex(childIndex)
        
        // orderingCriteria is a closure that will take in either a
        // min heap closure or max heap closure
        // Heap(<) min
        // Heap(>) max
        while childIndex > 0 && orderingCriteria(child, nodes[parentIndex]) {
            // keep swapping
            nodes[childIndex] = nodes[parentIndex] // swap child and parent value
            childIndex = parentIndex // traverse up the heap
            parentIndex = self.parentIndex(childIndex) // find new parent index
        }
        
        // at the end of the comparison we will insert the child
        // in the appropriate position
        nodes[childIndex] = child // new child inserted
    }
    
    // always removed the top node
    mutating func remove() -> Int? { // remove the top, could be min or max based on the type of Heap
        // check if the Heap is empty
        guard !nodes.isEmpty else { return nil }
        
        // if the Heap has only one child, remove and return the node
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        // if multiple nodes exist
        let removedValue = nodes[0] // first value or top value
        
        nodes[0] = nodes.removeLast() // remove the last value and insert into the first position
        
        // heapify the Heap, or make sure the Heap Property is satisfied
        shiftDown(from: 0, to: nodes.count)
        
        return removedValue
    }
    
    mutating func shiftDown(from index: Int, to endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(index)
        let rightChildIndex = self.rightChildIndex(index)
        
        var currentIndex = index // in this case starts from 0 or the top of the Heap
        
        // compare left child and right child vs the current index or parent index
        if leftChildIndex < endIndex && orderingCriteria(nodes[leftChildIndex], nodes[currentIndex]) {
            currentIndex = leftChildIndex
        }
        if rightChildIndex < endIndex && orderingCriteria(nodes[rightChildIndex], nodes[currentIndex]) {
            currentIndex = rightChildIndex
        }
        
        // if current index is equal to index then no swaps will take place
        if currentIndex == index {
            return // exit
        }
        
        // otherwise we need to swap indices: currentIndex swap with index
        nodes.swapAt(currentIndex, index) // swaps indices in place, runtime is constant O(1)
        
        
        // keep performing step above recursivly
        shiftDown(from: currentIndex, to: endIndex)
    }
    
    /*
     10
     /    \
     2      21
     / \    /  \
     8   16  30   36
     */
}

/*
 2
 /    \
 8      21
 / \    /  \
 10  16  30   36
 */


var minHeap = Heap(<) // < denotes that it's a min heap

print(minHeap.parentIndex(5)) // 2

print(minHeap.leftChildIndex(2)) // 5

print(minHeap.parentIndex(6)) // 2

print(minHeap.parent(3) ?? -999) // 8

print(minHeap.leftChild(6) ?? -999) // nil

print(minHeap.rightChild(6) ?? -999) // nil

print(minHeap.peek() ?? -999) // 2

/*
 -6
 /    \
 2      21
 / \    /  \
 8  16  30   36
 /
 10
 */

minHeap.insert(-6)

print(minHeap.peek() ?? -999) // -6

print(minHeap.leftChild(0) ?? -999) // 2
print(minHeap.rightChild(0) ?? -999) // 21

// test remove
print(minHeap.remove() ?? -999) // -6

print(minHeap.peek() ?? -999) // 2


// Preview
// +
// + is defines as (Int, Int) -> Int
// arr.reduce(0, +)
// Heap(>) max, descending
// Heap(<) min, ascending

// test creating a heap from an unsorted array
//

var heap  = Heap(array: [10, 4, 12, 0, -3, 7], >) // min heap, > max heap
print(heap.peek() ?? -999) // -3

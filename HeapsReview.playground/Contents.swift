import Foundation

struct MinHeap {
    
    var items = [Int]()
    
    public init (array: [Int]) {
        convert(array: array)
    }
    
    private mutating func convert(array: [Int]) {
        items = array
        for i in stride(from: items.count / 2 - 1, through: 0, by: -1) {
            shiftDown(from: i, to: items.count)
        }
    }
    
    //  get index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // boolean check, to see if child/parent
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // return item from heap
    public func returnLeftChild(_ index: Int) -> Int? {
        guard getLeftChildIndex(index) < items.count else { return nil }
        return items[getLeftChildIndex(index)]
    }
    
    private func returnRightChild(_ index: Int) -> Int? {
        guard getRightChildIndex(index) < items.count else {return nil}
        return items[getRightChildIndex(index)]
    }
    
    private func returnParent(_ index: Int) -> Int? {
        guard getParentIndex(index) > 0 else {return nil}
        return items[getParentIndex(index)]
    }
    
    // heap operations
    public func peek() -> Int? {
        return items.first
    }
    
    public mutating func add(_ item: Int) {
        items.append(item)
        shiftUp(items.count - 1)
    }
    
    public mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = items[childIndex]
        var parentIndex = self.getParentIndex(childIndex)
        
        while childIndex > 0 && items[parentIndex] > child {
            items[childIndex] = items[parentIndex]
            childIndex = parentIndex
            parentIndex = self.getParentIndex(childIndex)
        }
        items[childIndex] = child
    }
    
    public mutating func removeTop() -> Int? {
        guard !items.isEmpty else { return nil }
        
        if items.count == 1 {
            return items.removeLast()
        }
        
        let value = items[0]
        
        items[0] = items.removeLast()
        
        shiftDown(from: 0, to: items.count)
        
        return value
    }
    
    public mutating func shiftDown(from index: Int, to endIndex: Int) {
        let leftChildIndex = self.getLeftChildIndex(index)
        let rightChildIndex = self.getRightChildIndex(index)
        
        var currentIndex = index
        
        if leftChildIndex < endIndex && items[leftChildIndex] < items[currentIndex] {
            currentIndex = leftChildIndex
        }
        
        if rightChildIndex < endIndex && items[rightChildIndex] < items[currentIndex] {
            currentIndex = rightChildIndex
        }
        
        if currentIndex == index {
            return
        }
        
        items.swapAt(currentIndex, index)
        
        shiftDown(from: currentIndex, to: endIndex)
    }
}

var heap = MinHeap(array: [5, 3, 9, 8, 7, 2])
print(heap)
print(heap.returnLeftChild(2) ?? -9999)
print(heap.returnLeftChild(1))

// 0 should be new min ??
heap.add(0)
print(heap)
print(heap.peek() ?? -9999)


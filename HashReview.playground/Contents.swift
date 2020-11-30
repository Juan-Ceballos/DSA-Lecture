import UIKit

// Hash Table aka Dictionary

// key needs to conform to hashable

// collision: happens when two values share the same index

// collision resolution: in our example we will use "chaining"

// "chaining" data structure will be using is an array but a linked list can also be used

// we will calculate the index to store our key, value pair using abs(hashvalue % bucket count)


// accessors subscript get{} set{}

struct HashTable<Key: Hashable, Value> {
    // tuple, representing element
    // key whatever we give it ["Juan": 0]
    private typealias Element = (key:Key, value:Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    // getter of count public, access control (set)
    // setter is private
    private (set) public var count = 0
    
    // allow the user of our HashTable API to
    // specify the capacity of our HashTable
    init(capacity: Int) {
        // crates buckets [[Element]]
        // [], [], []
        assert(capacity > 0)
        buckets = Array(repeating: [], count: capacity)
    }
    
    // calculate which index key value pair will be placed in
    private func index(for key: Key) -> Int {
        // index 0, 1, 2, or 3
        return abs(key.hashValue % buckets.count)
    }
    
    // update value ***
    mutating public func update(value: Value, for key: Key) -> Value? {
        let index = self.index(for: key)
        
        // search if element exist
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                // subscript matrix, modifying bucket
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // if element does not exist add it
        let element = Element(key, value)
        buckets[index].append(element)
        count += 1
        return nil
    }
    
    // subscript ***
    // similar to init, built in function, allows for dict[""]
    subscript(_ key: Key) -> Value? {
        set {
           // set has access to a "newValue" optional property
            if let value = newValue {
                update(value: value, for: key)
            } else { // if new value is nil then remove element
                // TODO: remove value(for:)
            }
        } get {
            // TODO: implement value(for:)
            return nil
        }
    }
}

var jobSearchDict = HashTable<String, String>(capacity: 5)
jobSearchDict.update(value: "Netflix", for: "Applied")
jobSearchDict["Apple"] = "Applied" //no subscript function
print(jobSearchDict)


import UIKit

var arr = [1,1,1,2,2,3,4,5]
var uniqueNumbers: Set<Int> = []

for num in arr {
    let oldValue = uniqueNumbers.update(with: num)
    print("oldValue: \(oldValue)")
    if oldValue != nil {
        print("arr has dupes")
        break
    }
}

// intersection
// common elements of two groups
let employeeOneProficientLanguages: Set = ["Java", "Kotlin", "C", "Python", "SQL", "Go", "Dart", "JavaScript"]
let employeeTwoProficientLanguages: Set = ["Swift", "Objective-C", "C", "Python", "JavaScript"]
let languagesInCommon = employeeOneProficientLanguages.intersection(employeeTwoProficientLanguages)
print(languagesInCommon) // ["C", "Python", "JavaScript"]

let commonLanguages = employeeOneProficientLanguages.intersection(employeeTwoProficientLanguages)
print(commonLanguages)

// subtract
let dsaTopicsToStudy: Set = ["Big O Notation", "String", "Array", "Dictionary", "Set", "Character", "CharacterSet", "Stack", "Queue", "Linked List"]
let topicsCompleted: Set = ["Big O Notation", "String", "Array", "Dictionary", "Linked List"]
let topicsRemaining = dsaTopicsToStudy.subtracting(topicsCompleted)
print(topicsRemaining) // ["Queue", "Stack", "CharacterSet", "Character", "Set"]

let remainingTopics = dsaTopicsToStudy.subtracting(topicsCompleted)

print(remainingTopics)

// symmetricDifference
// genres we each uniquely know
let myGenres: Set = ["Soca", "Reggae", "Hip Hop", "Country", "Blues", "Jazz", "Funk", "Zouk"]
let yourGenres: Set = ["Hip Hop", "Reggae", "Folk", "Jazz", "Blues", "Hi-Life", "Techno", "House"]
let combinedUniqueGenres = myGenres.symmetricDifference(yourGenres)

print(combinedUniqueGenres)

// NSOrderedSet and NSMutableOrderedSet => objective c api
let dupes = [1,1,1,2,2,3,3,3,3,4] // array containing duplicates
let regularSet = Set(dupes)
print(regularSet)

let orderedSet = NSOrderedSet(array: dupes)

print(orderedSet)
print("last value of ordered set is  \(orderedSet[orderedSet.count - 1])")
var mutableOrderedSet = NSMutableOrderedSet(array: dupes) // NS => Next Step => Jobs started NS, macOS
mutableOrderedSet.add(10)
mutableOrderedSet.insert(11, at: 3)
print(mutableOrderedSet)


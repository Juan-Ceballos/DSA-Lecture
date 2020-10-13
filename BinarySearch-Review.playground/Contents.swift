import UIKit

/*
Write a function to perform a linear search to find a given value, function
should return the index of the target value ?
Example 1
input = [1, 2, 3, 4, 5], target: -7
output = -1
Example 2
input = [1, 2, 3, 4, 5], target: 4
output = 3
*/

// func findValue(inputArr: [Int], target: Int) -> Int {
//   for (index, element) in inputArr.enumerated() {
//     if target == element {
//       return index
//     }
//   }
//   return -1
// }

// print(findValue(inputArr: [0, 1, 2, 3, 4], target: 2))

// func numList() {
//   for num in 0...10 {
//     print(num)
//   }
// }

// func numList2() {
//   var num = 0
//   while num <= 10 {
//     print(num)
//     num += 1
//   }
// }

// numList()
// numList2()

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
  // [1, 2, 3, 4, 5]

  // variable to keep track of low and high indices
  var low = 0
  var high = arr.count

  // < takes care of - 1 on high
  while low < high {
    let middleIndex = (high + low) / 2 // todo optimized MI
    let currentValue = arr[middleIndex]

    // scenario 1
    if currentValue == target {
      return middleIndex // target found
    }

    // scenario 2
    // 3 < 5, if searching for 5
    // go to the right
    else if currentValue < target {
      // change the low
      low = middleIndex + 1
    }

    // scenario 3
    else { // go left
      high = middleIndex // change high
    }
  }

  // scenario 4
  return -1
}

let binarySearchResult = binarySearch([0, 1, 2, 3, 4, 5], 4)
print(binarySearchResult)

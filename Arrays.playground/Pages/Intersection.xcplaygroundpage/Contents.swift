
import XCTest

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

    var numDict: [Int: Int] = [:]
    var result: [Int] = []

    nums1.forEach { num in
        let value = numDict[num]
        if let value = value {
            numDict[num] = value + 1
        } else {
            numDict[num] = 0
        }
    }

    nums2.forEach { num in
        let value = numDict[num]
        if let value = value, value >= 0 {
            numDict[num] = value - 1
            result.append(num)
        }
    }

    return result
}


intersect([1,2,2,1], [2,2])
intersect([4,9,5], [9,4,9,8,4])
intersect([4,9,5, 4, 4, 9, 4], [9,4,9,8,4])


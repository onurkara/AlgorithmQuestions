
import XCTest

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result: [Int] = []
    var dict: [Int: Int] = [:]

    for int in nums1 {
        if let value = dict[int] {
            dict[int] = value + 1
        } else {
            dict[int] = 1
        }
    }

    for int in nums2 {
        if let value = dict[int] {
            result.append(int)
            dict[int] = value - 1
            if dict[int] == 0 {
                dict.removeValue(forKey: int)
            }
        }
    }

    return result
}

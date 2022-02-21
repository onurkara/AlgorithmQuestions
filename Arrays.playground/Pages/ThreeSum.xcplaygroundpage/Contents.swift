//: [Previous](@previous)

import XCTest

func threeSum(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []

    let numsCount = nums.count
    let tempNums = nums.sorted()

    guard numsCount > 2 else {
        return []
    }

    for i in 0...numsCount - 3 {
        if i != 0 && tempNums[i] == tempNums[i-1] {
             continue
        }
        for j in 1...numsCount - 2 {
            for k in 2...numsCount - 1 {
                let numsFirst = tempNums[i]
                let numsSecond = tempNums[j]
                let numsThird = tempNums[k]

                if numsFirst + numsSecond + numsThird == 0 {
                    result.append([numsFirst, numsSecond, numsThird])
                    break
                }
            }
        }
    }

    return result
}

print(threeSum([-1,0,1,2,-1,-4]))


final class ThreeSumTests: XCTestCase {

    func testEmptyArray() {
        let nums: [Int] = []
        XCTAssertEqual(threeSum(nums), [])
    }

    func testSingleItemArray() {
        let nums: [Int] = [1]
        XCTAssertEqual(threeSum(nums), [])
    }

    func testDoubleItemArray() {
        let nums: [Int] = [1,2]
        XCTAssertEqual(threeSum(nums), [])
    }

    func testThreeFalseItem() {
        let nums: [Int] = [1,2,3]
        XCTAssertEqual(threeSum(nums), [])
    }

    func testThreeTrueItem() {
        let nums: [Int] = [-1,0,1]
        XCTAssertEqual(threeSum(nums), [[-1,0,1]])
    }
}


ThreeSumTests.defaultTestSuite.run()

import XCTest

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var index = 0
    while index < nums.endIndex-1 {
        if nums[index] == nums[index+1] {
            nums.remove(at: index)
        } else {
            index += 1
        }
    }

    return nums.count
}

final class ArrayEasyTests: XCTestCase {

    func testRemoveDuplicatesEmptyArray() {
        var nums: [Int] = []
        let newCounts = removeDuplicates(&nums)
        XCTAssertEqual(newCounts, 0)
        XCTAssertEqual(nums, [])
    }

    func testRemoveDuplicatesSingleItemArray() {
        var nums: [Int] = [1]
        let newCounts = removeDuplicates(&nums)
        XCTAssertEqual(newCounts, 1)
        XCTAssertEqual(nums, [1])
    }

    func testRemoveDuplicatesUniqueArray() {
        var nums: [Int] = [1,2]
        let newCounts = removeDuplicates(&nums)
        XCTAssertEqual(newCounts, 2)
        XCTAssertEqual(nums, [1,2])
    }

    func testRemoveDuplicates1() {
        var nums = [1,1,2]
        let newCounts = removeDuplicates(&nums)
        XCTAssertEqual(newCounts, 2)
        XCTAssertEqual(nums, [1,2])
    }

    func testRemoveDuplicates2() {
        var nums = [1,1,2,2]
        let newCounts = removeDuplicates(&nums)
        XCTAssertEqual(newCounts, 2)
        XCTAssertEqual(nums, [1,2])
    }

    func testRemoveDuplicates3() {
        var nums = [1,1,2,2,3,4,5,5,5,5]
        let newCounts = removeDuplicates(&nums)
        XCTAssertEqual(newCounts, 5)
        XCTAssertEqual(nums, [1,2,3,4,5])
    }
}

ArrayEasyTests.defaultTestSuite.run()

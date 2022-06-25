import XCTest

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var initialUniqueItemIndex = 0

    if nums.isEmpty {
        return 0
    }

    for index in 0..<nums.count - 1 {
        if nums[index] != nums[index + 1 ] {
            initialUniqueItemIndex += 1
            nums[initialUniqueItemIndex] = nums[index+1]
        }
    }
    return nums.count
}

final class RemoveDuplicateTests: XCTestCase {

    func testRemoveDuplicatesEmptyArray() {
        var nums: [Int] = []
        removeDuplicates(&nums)
        XCTAssertEqual(nums, [])
    }

    func testRemoveDuplicatesSingleItemArray() {
        var nums: [Int] = [1]
        removeDuplicates(&nums)
        XCTAssertEqual(nums, [1])
    }

    func testRemoveDuplicatesUniqueArray() {
        var nums: [Int] = [1,2]
        removeDuplicates(&nums)
        XCTAssertEqual(nums, [1,2])
    }

    func testRemoveDuplicates1() {
        var nums = [1,1,2]
        removeDuplicates(&nums)
        XCTAssertEqual(nums, [1,2,2])
    }


    func testRemoveDuplicates2() {
        var nums = [1,1,2,2]
        removeDuplicates(&nums)
        XCTAssertEqual(nums, [1,2,2,2])
    }

    func testRemoveDuplicates3() {
        var nums = [1,1,2,2,3,4,5,5,5,5]
        removeDuplicates(&nums)
        XCTAssertEqual(nums, [1,2,3,4,5,4,5,5,5,5])
    }
}

RemoveDuplicateTests.defaultTestSuite.run()

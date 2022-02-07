

import XCTest

func containsDuplicate(_ nums: [Int]) -> Bool {

    let numSet: Set<Int> = Set(nums)
    return nums.count != numSet.count
}

final class ContainsDuplicateTests: XCTestCase {

    func testEmptyArray() {
        let nums: [Int] = []
        XCTAssertEqual(false, containsDuplicate(nums))
    }

    func testSingleItemArray() {
        let nums: [Int] = [1]
        XCTAssertEqual(false, containsDuplicate(nums))
    }

    func testContainsItemArray() {
        let nums: [Int] = [1,1]
        XCTAssertEqual(true, containsDuplicate(nums))
    }

    func testContainsItemArray2() {
        let nums: [Int] = [1,2]
        XCTAssertEqual(false, containsDuplicate(nums))
    }

    func testContainsItemArray3() {
        let nums: [Int] = [1,2,3,1]
        XCTAssertEqual(true, containsDuplicate(nums))
    }
}


ContainsDuplicateTests.defaultTestSuite.run()

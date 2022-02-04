
import XCTest

func rotate(_ nums: inout [Int], _ k: Int) {

    if nums.isEmpty || k == 0 {
        return
    }

    let returnCount = k % nums.count

    for _ in 0..<returnCount {
        let last = nums.last ?? 0
        nums.removeLast()
        nums.insert(last, at: 0)
    }
}

final class RotateArrayTests: XCTestCase {

    func testEmptyArray() {
        var nums: [Int] = []
        rotate(&nums, 5)
        XCTAssertEqual(nums, [])
    }

    func testSingleItemArray() {
        var nums: [Int] = [1]
        rotate(&nums, 2)
        XCTAssertEqual(nums, [1])
    }

    func testTwoItemArray() {
        var nums: [Int] = [1,2]
        rotate(&nums, 1)
        XCTAssertEqual(nums, [2,1])
    }

    func testTwoItemTwiceArray() {
        var nums: [Int] = [1,2]
        rotate(&nums, 2)
        XCTAssertEqual(nums, [1,2])
    }

    func testMultipleArray() {
        var nums: [Int] = [1,2,3,4,5,6]
        rotate(&nums, 3)
        XCTAssertEqual(nums, [4,5,6,1,2,3])
    }

    func testMultipleArray2() {
        var nums: [Int] = [-1,-100,3,99]
        rotate(&nums, 2)
        XCTAssertEqual(nums, [3,99,-1,-100])
    }

    func testMultipleArray3() {
        var nums: [Int] = [1,2,3,4,5,6,7]
        rotate(&nums, 3)
        XCTAssertEqual(nums, [5,6,7,1,2,3,4])
    }
}

RotateArrayTests.defaultTestSuite.run()

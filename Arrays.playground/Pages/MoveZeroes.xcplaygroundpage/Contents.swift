//: [Previous](@previous)

import XCTest

func moveZeroes(_ nums: inout [Int]) {
    var countOfZeroes = 0
    nums.removeAll { num in
        if num == 0 {
            countOfZeroes += 1
            return true
        }

        return false
    }

    let zeroesArray = [Int](repeatElement(0, count: countOfZeroes))
    nums += zeroesArray
}


final class MoveZeroesTests: XCTestCase {

    func testEmptyArray() {
        var nums: [Int] = []
        moveZeroes(&nums)
        XCTAssertEqual([], nums)
    }

    func testSingleZeroArray() {
        var nums: [Int] = [0]
        moveZeroes(&nums)
        XCTAssertEqual([0], nums)
    }

    func testSingleItemArray() {
        var nums: [Int] = [1]
        moveZeroes(&nums)
        XCTAssertEqual([1], nums)
    }

    func testMultipleItemArray1() {
        var nums: [Int] = [1,0,1]
        moveZeroes(&nums)
        XCTAssertEqual([1,1,0], nums)
    }

    func testMultipleItemArray2() {
        var nums: [Int] = [1,0]
        moveZeroes(&nums)
        XCTAssertEqual([1,0], nums)
    }

    func testMultipleItemArray3() {
        var nums: [Int] = [1,0,2,3,5,4,0,8]
        moveZeroes(&nums)
        XCTAssertEqual([1,2,3,5,4,8,0,0], nums)
    }
}


MoveZeroesTests.defaultTestSuite.run()

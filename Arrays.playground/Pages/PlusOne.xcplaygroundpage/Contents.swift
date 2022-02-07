
import XCTest

func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits

    guard let lastDigit = digits.last else {
        return result
    }

    if lastDigit != 9 {
        result[digits.endIndex - 1] = lastDigit + 1
        return result
    }


    for digit in (0...digits.count-1).reversed() {
        if result[digit] == 9 {
            result[digit] = 0
        } else {
            result[digit] += 1
            break
        }
    }

    guard let firstDigit = result.first else {
        return result
    }

    if firstDigit == 0 {
        result.insert(1, at: 0)
    }


    return result
}

final class PlusOneTests: XCTestCase {

    func testEmptyArray() {
        XCTAssertEqual([], plusOne([]))
    }

    func testPlusOne1() {
        XCTAssertEqual([1,2], plusOne([1,1]))
    }

    func testPlusOne2() {
        XCTAssertEqual([1,2,3,5], plusOne([1,2,3,4]))
    }

    func testPlusOne3() {
        XCTAssertEqual([3], plusOne([2]))
    }

    func testPlusOne4() {
        XCTAssertEqual([1,1,2,3,1,4,6], plusOne([1,1,2,3,1,4,5]))
    }

    func testPlusOne5() {
        XCTAssertEqual([1,0], plusOne([9]))
    }

    func testPlusOne6() {
        XCTAssertEqual([3,0], plusOne([2,9]))
    }

    func testPlusOne7() {
        XCTAssertEqual([1,0,0], plusOne([9,9]))
    }

    func testPlusOne8() {
        XCTAssertEqual([1,1,0], plusOne([1,0,9]))
    }
}


PlusOneTests.defaultTestSuite.run()

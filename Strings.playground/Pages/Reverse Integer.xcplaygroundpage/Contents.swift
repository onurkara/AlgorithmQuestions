//: [Previous](@previous)

import XCTest

func reverse(_ x: Int) -> Int {


    var tempX = x

    var result =  x % 10
    tempX = x / 10
    while tempX >= 1 || tempX <= -1 {
        result = result * 10
        result += tempX % 10
        tempX = tempX / 10
    }

    if result > Int32.max || result < Int32.min {
        return 0
    }

    return result

}

final class ReverseIntText: XCTestCase {

    func testReverseZeroItem() {
        let x = reverse(0)
        XCTAssertEqual(x, 0)
    }

    func testReverseSingleItem() {
        let x = reverse(1)
        XCTAssertEqual(x, 1)
    }

    func testReverseDoubleItem() {
        let x = reverse(12)
        XCTAssertEqual(x, 21)
    }

    func testReverseThreeeItem() {
        let x = reverse(123)
        XCTAssertEqual(x, 321)
    }

    func testReverseFourtem() {
        let x = reverse(1234)
        XCTAssertEqual(x, 4321)
    }

    func testReverseFourtem2() {
        let x = reverse(12034)
        XCTAssertEqual(x, 43021)
    }
}

ReverseIntText.defaultTestSuite.run()

//: [Previous](@previous)

import XCTest

func reverseString(_ s: inout [Character]) {
    let value = s

    guard !s.isEmpty else {
        return
    }

    for index in 0...value.endIndex - 1 {
        s[index] = value[value.endIndex - 1 - index]
    }
}

var str: [Character] = ["a"]
reverseString(&str)

final class ReverseStringTest: XCTestCase {

    func testEmptyChars() {
        var str: [Character] = []
        reverseString(&str)
        XCTAssertEqual(str, [])
    }

    func testOneChars() {
        var str: [Character] = ["a"]
        reverseString(&str)
        XCTAssertEqual(str, ["a"])
    }

    func testTwoChars() {
        var str: [Character] = ["a","b"]
        reverseString(&str)
        XCTAssertEqual(str, ["b","a"])
    }

    func testMultipleChars() {
        var str: [Character] = ["a","b", "c", "d", "e"]
        reverseString(&str)
        XCTAssertEqual(str, ["e","d", "c", "b", "a"])
    }
}



ReverseStringTest.defaultTestSuite.run()

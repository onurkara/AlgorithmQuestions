//: [Previous](@previous)

import XCTest

func firstUniqChar(_ s: String) -> Int {

    let threshold = Int.max
    var charDict: [Character: Int] = [:]

    for (index, char) in s.enumerated() {
        if charDict[char] == nil {
            charDict[char] = index
        } else if charDict[char] != nil {
            charDict[char] = threshold
        }
    }

    let value = charDict.values.min()
    if value == threshold {
        return -1
    } else {
        return value ?? -1
    }
}

final class FirstUniqueCharTests: XCTestCase {

    func testEmpty() {
        let result = firstUniqChar("")
        XCTAssertEqual(result, -1)
    }

    func testSingle() {
        let result = firstUniqChar("a")
        XCTAssertEqual(result, 0)
    }

    func testUniqueChar2() {
        let result = firstUniqChar("ab")
        XCTAssertEqual(result, 0)
    }

    func testUniqueChar3() {
        let result = firstUniqChar("aba")
        XCTAssertEqual(result, 1)
    }

    func testUniqueChar4() {
        let result = firstUniqChar("abaaaaabcd")
        XCTAssertEqual(result, 8)
    }

    func testUniqueChar5() {
        let result = firstUniqChar("abc")
        XCTAssertEqual(result, 0)
    }

    func testUniqueChar6() {
        let result = firstUniqChar("aabb")
        XCTAssertEqual(result, -1)
    }
}

FirstUniqueCharTests.defaultTestSuite.run()

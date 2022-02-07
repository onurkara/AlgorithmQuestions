import XCTest

func singleNumber(_ nums: [Int]) -> Int {

    var numsDict: [Int: Bool] = [:]
    nums.forEach { num in
        if numsDict[num] != nil {
            numsDict[num] = true
        } else {
            numsDict[num] = false
        }

    }

    return numsDict.first { $0.value == false }?.key ?? -1
}

final class SingleNumberTests: XCTestCase {

    func testSingleNumber1() {
        XCTAssertEqual(1, singleNumber([1,2,3,4,5,2,3,4,5]))
    }

    func testSingleNumber2() {
        XCTAssertEqual(1, singleNumber([1,2,2]))
    }

    func testSingleNumber3() {
        XCTAssertEqual(1, singleNumber([1,2,3,4,5,5,4,3,2]))
    }
}


SingleNumberTests.defaultTestSuite.run()

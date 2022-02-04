//: [Previous](@previous)

import XCTest

func maxProfit(_ prices: [Int]) -> Int {
    var totalProfit = 0

    if prices.isEmpty {
        return totalProfit
    }

    for index in 0..<prices.count-1 {
        if prices[index+1] > prices[index] {
            totalProfit += prices[index+1] - prices[index]
        }
    }

    return totalProfit
}

final class BestTimeBuySellStockTests: XCTestCase {

    func testEmptyStock() {
        let prices: [Int] = []
        let maxProfit = maxProfit(prices)
        XCTAssertEqual(maxProfit, 0)
    }

    func testOneStock() {
        let prices: [Int] = [1]
        let maxProfit = maxProfit(prices)
        XCTAssertEqual(maxProfit, 0)
    }

    func testTwoStockProfit() {
        let prices: [Int] = [1,2]
        let maxProfit = maxProfit(prices)
        XCTAssertEqual(maxProfit, 1)
    }

    func testTwoStockNatural() {
        let prices: [Int] = [3,2]
        let maxProfit = maxProfit(prices)
        XCTAssertEqual(maxProfit, 0)
    }

    func testMultiplestocks() {
        let prices: [Int] = [7,1,5,3,6,4]
        let maxProfit = maxProfit(prices)
        XCTAssertEqual(maxProfit, 7)
    }

    func testMultiplestocks2() {
        let prices: [Int] = [1,2,3,4,5]
        let maxProfit = maxProfit(prices)
        XCTAssertEqual(maxProfit, 4)
    }
}

BestTimeBuySellStockTests.defaultTestSuite.run()

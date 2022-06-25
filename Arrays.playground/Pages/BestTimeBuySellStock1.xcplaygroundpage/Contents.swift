//: [Previous](@previous)


func maxProfit(prices: [Int]) -> Int {

    var minValue = Int.max
    var maxValue = Int.min
    for i in 0..<prices.count-1 {
        if prices[i] < prices[i+1] {
            if prices[i] < minValue {
                minValue = prices[i]
            }

            if prices[i+1] > maxValue {
                maxValue = prices[i+1]
            }
        }
    }

    return maxValue - minValue
}


maxProfit(prices: [7,1,5,4,6,4])



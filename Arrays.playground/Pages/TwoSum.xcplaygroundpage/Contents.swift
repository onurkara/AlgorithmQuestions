//: [Previous](@previous)

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numsDict: [Int: Int] = [:]
    for index in 0..<nums.count {
        if let found = numsDict[target - nums[index]] {
            return [found, index]
        } else {
            numsDict[nums[index]] = index
        }
    }

    return []
}

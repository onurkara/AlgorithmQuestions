import XCTest

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.isEmpty {
        return 0

    }
    var index  = 1
    for i in 1..<nums.count {
        if nums[i - 1] != nums[i] {
            nums[index] = nums[i]
            index += 1
        }
    }
    return index
}

func rotateArray(_ nums: inout [Int], _ k: Int) {

    if k < 1 || nums.count == 0 {
        return
    }

    let k = k % nums.count

    let numsCount = nums.count
    let arr1 = (Array(nums[0..<numsCount - k]))
    let arr2 = (Array(nums[k..<numsCount]))
    nums = arr1 + arr2
}


func containsDuplicate(_ nums: [Int]) -> Bool {
    nums.count != Set(nums).count
}

func singleNumber(_ nums: [Int]) -> Int {
    var numsSeen = Set<Int>()

    for num in nums {
        if !numsSeen.insert(num).0 {
            numsSeen.remove(num)
        }
    }
    return numsSeen.first!
}

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dict = [Int: Int]()
    var results = [Int]()

    for num in nums1 {
        dict[num, default: 0] += 1
    }

    for num in nums2 {
        guard let count = dict[num], count > 0 else { continue }
        results.append(num)
        dict[num] = count - 1
    }

    return results
}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var sumDict: [Int: Int] = [:]

    for index in 0...nums.count - 1 {
        let targetedValue = target - nums[index]
        if let targetedIndex = sumDict[targetedValue] {
            return [index,targetedIndex]
        } else {
            sumDict[nums[index]] = index
        }
    }
    return []
}

func lengthOfLongestSubstring(_ s: String) -> Int {
    var result = 0
    var foundCharacters: [Character: Int] = [:]
    var leftWindowIndex = 0
    for (rWindowIndex, character) in s.enumerated() {
        if let foundCharacterIndex = foundCharacters[character] {
            leftWindowIndex = max(foundCharacterIndex, leftWindowIndex)
        }
        result = max(result, rWindowIndex - leftWindowIndex + 1)
        foundCharacters[character] = rWindowIndex + 1
    }

    return result
}

func longestCommonPrefix(_ strs: [String]) -> String {

    guard let minStr = strs.min(),
          let firstChar = minStr.first else {
        return ""
    }

    var result = ""
    let minStrArray = Array(minStr)



    for i in 0...minStrArray.count - 1 {
        let value = String(minStrArray[i])

        if strs.allSatisfy({ str in
            str.hasPrefix(result + value)
        }) {
            result += value
        } else {
            return result
        }
    }

    return result
}

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramDictionary: [String: [String]] = [:]

    for str in strs {
        let sortedStr = String(str.sorted())

        if var value = anagramDictionary[sortedStr] {
            value.append(str)
            anagramDictionary[sortedStr] = value
        } else {
            anagramDictionary[sortedStr] = [str]
        }
    }

    var result = anagramDictionary.values.map { $0 }
    return result
}

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var totalCount = m + n - 1
    var i = m - 1
    var j = n - 1

    while totalCount >= 0 && j>=0 {
        if i>=0 && nums1[i] > nums2[j] {
            nums1[totalCount] = nums1[i]
            i -= 1
        } else {
            nums1[totalCount] = nums2[j]
            j -= 1
        }
        totalCount -= 1
    }
}

func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.count <= 1 {
        return intervals
    }

    var result = [[Int]]()
    var tempIntervals = intervals
    tempIntervals.sort { arr1, arr2 in
        return arr1[0] < arr2[0]
    }

    var currentInterval = tempIntervals[0]
    for interval in tempIntervals {
        if currentInterval[1] >= interval[0] {
            currentInterval[1] = max(currentInterval[1], interval[1])
        } else {
            result.append(currentInterval)
            currentInterval = interval
        }
    }

    if !result.contains(currentInterval){
        result.append(currentInterval)
    }
    return result
}

func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int] {
    var result: [Int] = []
    var countDictionary: [Int: Int] = [:]

    for num in nums {
        if let value = countDictionary[num] {
            countDictionary[num] = value + 1
        } else {
            countDictionary[num] = 1
        }
    }

    countDictionary.sorted { item1, item2 in
        item1.value < item2.value
    }

    var index = 0
    for item in countDictionary {
        if index == k {
            break
        }

        index += 1
        result.append(item.key)
    }
    return result
}

func isValidSudoku(_ board: [[Character]]) -> Bool {

    var rowDic = [Int: [Int]]()
    var colDic = [Int: [Int]]()
    var areaDic = [Int: [Int]]()

    for (row, board1) in board.enumerated() {
        for (col, char) in board1.enumerated() {
            guard let num = Int(String(char)) else { continue }
            let areaNum = (col / 3 * 10) - (row / 3)

            guard rowDic[row]?.contains(num) != true else { return false }
            guard colDic[col]?.contains(num) != true else { return false }
            guard areaDic[areaNum]?.contains(num) != true else { return false }

            rowDic[row, default: [Int]()].append(num)
            colDic[col, default: [Int]()].append(num)
            areaDic[areaNum, default: [Int]()].append(num)
        }
    }

    return true
}

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    let sArray = Array(s)
    let tArray = Array(t)
    var map = [Character: Character]()

    if sArray.count != tArray.count {
        return false
    }

    for i in 0..<sArray.count {
        let sChar = sArray[i]
        let tChar = tArray[i]

        if let value = map[sChar] {
            if value == tChar {
                continue
            } else {
                return false
            }
        } else {
            if map.values.contains(tChar) {
                return false
            } else {
                map[sChar] = tChar
            }
        }
    }

    return true
}

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var list1Dictionary = [String: Int]()
    var list2Dictionary = [String: Int]()

    for (index, restaurant) in list1.enumerated() {
        list1Dictionary[restaurant] = index
    }

    var restaurants = [String: Int]()

    for (index, restaurant) in list2.enumerated() {
        list2Dictionary[restaurant] = index

        if let index2 = list1Dictionary[restaurant] {
            restaurants[restaurant] = abs(index2 + index)
        }
    }

    let minIndexSum = restaurants.values.min()

    return restaurants.filter({ $0.value == minIndexSum }).map({ $0.0 })
}

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.isEmpty || intervals.count == 1 {
        return true
    }

    var sortedIntervals = intervals
    sortedIntervals.sort { arr1, arr2 in
        return arr1[0] < arr2[0]
    }

    for index in 0...sortedIntervals.count - 2 {
        if sortedIntervals[index][1] > sortedIntervals[index+1][0] {
            return false
        }
    }

    return true
}

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let intervalsCount = intervals.count

    if intervalsCount == 0 || intervalsCount == 1 {
        return intervalsCount
    }

    let startPoints = intervals.map { $0[0] }.sorted()
    let endPoints = intervals.map { $0[1] }.sorted()

    var pointer = 0
    var rooms = 0
    for i in 0...intervalsCount - 1 {
        if startPoints[i] < endPoints[pointer] {
            rooms += 1
        } else {
            pointer += 1
        }
    }

    return rooms
}

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var result: [Int] = []
    var resultDictionary: [Int: Int] = [:]

    for num in nums {
        if let value = resultDictionary[num] {
            resultDictionary[num] = value + 1
        } else {
            resultDictionary[num] = 1
        }
    }

    resultDictionary.sorted { item1, item2 in
        item1.value > item2.value
    }

    var index = 0
    for item in resultDictionary {
        if index == k {
            break
        }

        result.append(item.key)
        index += 1
    }

    return result
}

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: nums.count - k + 1)

    for i in 0...nums.count - k {
        var tempResult = Int.min
        for j in i..<i + k {
            if nums[j] > tempResult {
                tempResult = nums[j]
            }
        }

        result[i] = tempResult
    }
    return result
}


func setZeroes(_ matrix: inout [[Int]]) {

    var zeroContainerRowSet: Set<Int> = Set<Int>()
    var zeroContainerColumnSet: Set<Int> = Set<Int>()

    let columnCount = matrix[0].count - 1
    let rowCount = matrix.count - 1

    for i in 0...rowCount {
        for j in 0...columnCount {
            if matrix[i][j] == 0 {
                zeroContainerRowSet.insert(i)
                zeroContainerColumnSet.insert(j)
            }
        }
    }

    for i in 0...rowCount {
        for j in 0...columnCount {
            if zeroContainerRowSet.contains(i) || zeroContainerColumnSet.contains(j) {
                matrix[i][j] = 0
            }
        }
    }
}


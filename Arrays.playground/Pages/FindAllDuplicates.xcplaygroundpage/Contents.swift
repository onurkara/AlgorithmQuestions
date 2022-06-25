//: [Previous](@previous)


func findDuplicates(_ nums: [Int]) -> [Int] {
    var duplicates: [Int] = []
    var duplicatedDictionary: [Int: Bool] = [:]

    for num in nums {
        if duplicatedDictionary[num] != nil {
            duplicatedDictionary[num] = true
        } else {
            duplicatedDictionary[num] = false
        }
    }

    for item in duplicatedDictionary {
        if item.value == true {
            duplicates.append(item.key)
        }
    }

    return duplicates
}

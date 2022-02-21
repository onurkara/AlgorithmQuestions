//: [Previous](@previous)


func isPalindrome(_ s: String) -> Bool {

    let filteredStr = s.lowercased().filter { $0.isNumber || $0.isLetter }
    return filteredStr == String(filteredStr.reversed())
}


isPalindrome("a")

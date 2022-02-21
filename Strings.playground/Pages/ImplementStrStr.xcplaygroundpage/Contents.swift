//: [Previous](@previous)

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {

    guard !needle.isEmpty else {
        return 0
    }

    guard haystack.count >= needle.count else {
        return -1
    }

    var needleMaxIndex = needle.count - 1
    var haystackIndex = 0


    while haystack.count > needleMaxIndex {
        let startIndex = haystack.index(haystack.startIndex, offsetBy: haystackIndex)
        let endIndex = haystack.index(haystack.startIndex, offsetBy: needleMaxIndex)
        let subString = String(haystack[startIndex...endIndex])

        if subString == needle {
            return haystackIndex
        }

        haystackIndex += 1
        needleMaxIndex += 1
    }

    return -1
}



strStr("abc", "c")
strStr("a", "a")
strStr("hello", "ll")
strStr("hellomella", "ella")
strStr("mississippi", "issip")

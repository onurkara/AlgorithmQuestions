//: [Previous](@previous)

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {

    let hayStackArray = Array(haystack)
    let needleArray = Array(needle)
    let hayStackCount = hayStackArray.count
    let needleCount = needleArray.count

    guard !needleArray.isEmpty else {
        return 0
    }

    guard hayStackCount >= needleCount else {
        return -1
    }


    for i in 0...hayStackCount - needleCount {
        if hayStackArray[i] == needleArray[0] {
            for j in 0..<needleCount {
                if hayStackArray[i+j] == needleArray[j] {
                    if j == needleCount - 1 {
                        return i
                    }
                } else {
                    break
                }
            }
        }
    }

    return -1
}



strStr("abc", "c")
strStr("a", "a")
strStr("hello", "ll")
strStr("hellomella", "ella")
strStr("mississippi", "issip")

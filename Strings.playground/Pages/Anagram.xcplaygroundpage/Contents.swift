//: [Previous](@previous)

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {

    //return s.sorted() == t.sorted()

    var sDict : [Character: Int] = [:]
    var tDict : [Character: Int] = [:]

    for char in s {
        if let count = sDict[char] {
            sDict[char] = count + 1
        } else {
            sDict[char] = 0
        }
    }

    for char in t {
        if let count = tDict[char] {
            tDict[char] = count + 1
        } else {
            tDict[char] = 0
        }
    }

    return sDict == tDict
}



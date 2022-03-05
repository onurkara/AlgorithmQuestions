//: [Previous](@previous)


func longestCommonPrefix(_ strs: [String]) -> String {

    let firstStr = strs.first ?? ""
    let firstStrCount = firstStr.count

    guard firstStrCount > 0 else {
        return ""
    }

    var result = ""
    for i in 0...firstStrCount-1 {
        let temp = firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)]
        result += String(temp)

        let isAllContains = strs.allSatisfy { str in
            str.hasPrefix(result)
        }

        if isAllContains {

        } else {
            result.removeLast()
        }

    }


    return result
}

//: [Previous](@previous)

import Foundation

func multiplesOf3Or5() -> Int {

    var result = 0
    for i in 1...999 {
        if (i % 3 == 0) || (i % 5 == 0) {
            result = i + result
        }
    }

    return result
}

func evenFibonacciNumbers() -> Int {
    var result = 0

    var fibNum = 0
    var firstNum = 0
    var secondNum = 1
    while fibNum < 4000000 {
        fibNum = firstNum + secondNum
        firstNum = secondNum
        secondNum = fibNum

        if fibNum % 2 == 0 {
            result += fibNum
        }
    }

    return result
}

func largestPrimeFactor() -> Int {
    var number = 600851475143
    var primeFactor = 2

    while number != 1 {
        if number % primeFactor == 0 {
            number = number / primeFactor
        } else {
            primeFactor += 1
        }
    }

    return primeFactor
}

func largestPalindrome() -> Int {

    var result = 0

    for i in stride(from: 999, to: 100, by: -1) {
        for j in stride(from: i, to: 100, by: -1) {
            let tempResult = i * j

            let first = String(tempResult)
            let second = String(tempResult).reversed()
            if first == String(second) {
                if tempResult > result {
                    print(first)
                    print(String(second))
                    result = tempResult
                }
            }
        }
    }
    return result
}

func smallestMultiple() -> Int {
    var numbers = Array(2...20)
    var divider = 2
    var result = 1

    while numbers.contains(where: { num in
        num > 1
    }) {
        var isDivided = false
        for index in 0...numbers.count - 1 {
            if numbers[index] % divider == 0 {
                numbers[index] = numbers[index] / divider
                isDivided = true
            }
        }

        if isDivided {
            result = result * divider
        } else {
            divider += 1
        }
    }
    return result
}

func sumSquareDifference() -> Int {

    var sumOfSquares = 0
    var squaresSum = 0

    for number in 1...100 {
        sumOfSquares += number * number
        squaresSum += number
    }

    squaresSum = squaresSum * squaresSum


    return squaresSum - sumOfSquares
}

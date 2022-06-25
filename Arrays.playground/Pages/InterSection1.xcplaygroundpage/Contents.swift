//: [Previous](@previous)

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    //Array(Set(nums1).intersection(Set(nums2)))

    var set1 = Set(nums1)
    var result: [Int] = []

    for int in nums2 {
        if set1.contains(int) {
            result.append(int)
            set1.remove(int)
        }
    }

    return result
}

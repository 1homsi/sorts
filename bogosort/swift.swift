import Foundation

func isSorted(_ arr: [Int]) -> Bool {
    for i in 0..<arr.count - 1 {
        if arr[i] > arr[i + 1] { return false }
    }
    return true
}

func bogosort(_ arr: [Int]) -> [Int] {
    var arr = arr
    while !isSorted(arr) {
        arr.shuffle()
    }
    return arr
}

let arr = [3, 1, 4, 1, 5, 9, 2, 6]
print(bogosort(arr))

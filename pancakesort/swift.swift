func flip(_ arr: inout [Int], _ k: Int) {
    var left = 0, right = k
    while left < right {
        arr.swapAt(left, right)
        left += 1; right -= 1
    }
}

func pancakeSort(_ arr: inout [Int]) {
    var size = arr.count
    while size > 1 {
        var maxIdx = 0
        for i in 1..<size {
            if arr[i] > arr[maxIdx] { maxIdx = i }
        }
        if maxIdx != size - 1 {
            if maxIdx != 0 { flip(&arr, maxIdx) }
            flip(&arr, size - 1)
        }
        size -= 1
    }
}

var arr = [3, 6, 2, 7, 4, 1, 5]
pancakeSort(&arr)
print(arr)

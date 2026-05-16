func countingSort(_ arr: inout [Int], exp: Int) {
    let n = arr.count
    var output = [Int](repeating: 0, count: n)
    var count = [Int](repeating: 0, count: 10)
    for i in 0..<n { count[(arr[i] / exp) % 10] += 1 }
    for i in 1..<10 { count[i] += count[i - 1] }
    for i in stride(from: n - 1, through: 0, by: -1) {
        let idx = (arr[i] / exp) % 10
        count[idx] -= 1
        output[count[idx]] = arr[i]
    }
    arr = output
}

func radixSort(_ arr: inout [Int]) {
    guard !arr.isEmpty else { return }
    let max = arr.max()!
    var exp = 1
    while max / exp > 0 {
        countingSort(&arr, exp: exp)
        exp *= 10
    }
}

var arr = [170, 45, 75, 90, 802, 24, 2, 66]
radixSort(&arr)
print(arr)

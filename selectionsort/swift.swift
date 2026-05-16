func selectionSort(_ arr: inout [Int]) {
    let n = arr.count
    for i in 0..<n {
        var minIdx = i
        for j in (i + 1)..<n {
            if arr[j] < arr[minIdx] { minIdx = j }
        }
        arr.swapAt(i, minIdx)
    }
}

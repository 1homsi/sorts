func gnomeSort(_ arr: inout [Int]) {
    var i = 0
    while i < arr.count {
        if i == 0 || arr[i] >= arr[i - 1] {
            i += 1
        } else {
            arr.swapAt(i, i - 1)
            i -= 1
        }
    }
}

func cocktailSort(_ arr: inout [Int]) {
    var swapped = true
    var start = 0
    var end = arr.count - 1
    while swapped {
        swapped = false
        for i in start..<end {
            if arr[i] > arr[i + 1] {
                arr.swapAt(i, i + 1)
                swapped = true
            }
        }
        if !swapped { break }
        swapped = false
        end -= 1
        if end > start {
            for i in stride(from: end - 1, through: start, by: -1) {
                if arr[i] > arr[i + 1] {
                    arr.swapAt(i, i + 1)
                    swapped = true
                }
            }
        }
        start += 1
    }
}

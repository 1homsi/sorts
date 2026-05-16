func combSort(_ arr: inout [Int]) {
    let n = arr.count
    var gap = n
    let shrink = 1.3
    var sorted = false
    while !sorted {
        gap = Int(Double(gap) / shrink)
        if gap <= 1 {
            gap = 1
            sorted = true
        }
        var i = 0
        while i + gap < n {
            if arr[i] > arr[i + gap] {
                arr.swapAt(i, i + gap)
                sorted = false
            }
            i += 1
        }
    }
}

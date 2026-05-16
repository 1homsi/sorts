def countingSort(arr) {
    def n := arr.size()
    if (n == 0) { return arr }
    var minVal := arr[0]
    var maxVal := arr[0]
    for v in arr {
        if (v < minVal) { minVal := v }
        if (v > maxVal) { maxVal := v }
    }
    def range := maxVal - minVal + 1
    def count := ([0] * range).diverge()
    for v in arr { count[v - minVal] += 1 }
    for i in (1..range - 1) { count[i] += count[i - 1] }
    def output := ([0] * n).diverge()
    var i := n - 1
    while (i >= 0) {
        def v := arr[i]
        def idx := v - minVal
        count[idx] -= 1
        output[count[idx]] := v
        i -= 1
    }
    return output.snapshot()
}

println(countingSort([4, 2, 2, 8, 3, 3, 1]))

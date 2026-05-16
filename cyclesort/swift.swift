func cycleSort(_ arr: inout [Int]) -> Int {
    var writes = 0
    let n = arr.count
    for cycleStart in 0..<(n - 1) {
        var item = arr[cycleStart]
        var pos = cycleStart
        for i in (cycleStart + 1)..<n {
            if arr[i] < item { pos += 1 }
        }
        if pos == cycleStart { continue }
        while item == arr[pos] { pos += 1 }
        (arr[pos], item) = (item, arr[pos])
        writes += 1
        while pos != cycleStart {
            pos = cycleStart
            for i in (cycleStart + 1)..<n {
                if arr[i] < item { pos += 1 }
            }
            while item == arr[pos] { pos += 1 }
            (arr[pos], item) = (item, arr[pos])
            writes += 1
        }
    }
    return writes
}

var arr = [5, 4, 3, 2, 1]
cycleSort(&arr)
print(arr)

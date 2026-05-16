def getDigit(x, exp) { (x // exp) % 10 }

def countingSort(arr, exp) {
    def result := [].diverge()
    for d in 0..9 {
        for x in arr {
            if (getDigit(x, exp) == d) { result.push(x) }
        }
    }
    result.snapshot()
}

def radixSort(arr) {
    if (arr.size() == 0) { return arr }
    var maxVal := 0
    for x in arr { if (x > maxVal) { maxVal := x } }
    var exp := 1
    var result := arr
    while ((maxVal // exp) > 0) {
        result := countingSort(result, exp)
        exp *= 10
    }
    result
}

def arr := [170, 45, 75, 90, 802, 24, 2, 66]
println(radixSort(arr))

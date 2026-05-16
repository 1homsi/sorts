var countingSort = Fn.new { |arr, exp|
    var n = arr.count
    var output = List.filled(n, 0)
    var count = List.filled(10, 0)
    for (x in arr) count[(x / exp).floor % 10] = count[(x / exp).floor % 10] + 1
    for (i in 1..9) count[i] = count[i] + count[i - 1]
    var i = n - 1
    while (i >= 0) {
        var idx = (arr[i] / exp).floor % 10
        count[idx] = count[idx] - 1
        output[count[idx]] = arr[i]
        i = i - 1
    }
    for (i in 0...n) arr[i] = output[i]
}

var radixSort = Fn.new { |arr|
    if (arr.count == 0) return
    var max = arr[0]
    for (x in arr) if (x > max) max = x
    var exp = 1
    while ((max / exp).floor > 0) {
        countingSort.call(arr, exp)
        exp = exp * 10
    }
}

var arr = [170, 45, 75, 90, 802, 24, 2, 66]
radixSort.call(arr)
System.print(arr)

var MIN_RUN = 32

var insertionSort = Fn.new { |arr, left, right|
    var i = left + 1
    while (i <= right) {
        var key = arr[i]
        var j = i - 1
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j]
            j = j - 1
        }
        arr[j + 1] = key
        i = i + 1
    }
}

var mergeRuns = Fn.new { |arr, left, mid, right|
    var lp = arr[left..mid]
    var rp = arr[(mid+1)..right]
    var i = 0
    var j = 0
    var k = left
    while (i < lp.count && j < rp.count) {
        if (lp[i] <= rp[j]) {
            arr[k] = lp[i]
            i = i + 1
        } else {
            arr[k] = rp[j]
            j = j + 1
        }
        k = k + 1
    }
    while (i < lp.count) { arr[k] = lp[i]; i = i + 1; k = k + 1 }
    while (j < rp.count) { arr[k] = rp[j]; j = j + 1; k = k + 1 }
}

var timsort = Fn.new { |arr|
    var n = arr.count
    var i = 0
    while (i < n) {
        var right = (i + MIN_RUN - 1).min(n - 1)
        insertionSort.call(arr, i, right)
        i = i + MIN_RUN
    }
    var size = MIN_RUN
    while (size < n) {
        var left = 0
        while (left < n) {
            var mid = (left + size - 1).min(n - 1)
            var right = (left + 2 * size - 1).min(n - 1)
            if (mid < right) mergeRuns.call(arr, left, mid, right)
            left = left + 2 * size
        }
        size = size * 2
    }
    return arr
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
System.print(timsort.call(arr))

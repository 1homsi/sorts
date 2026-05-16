def minRun := 32

def insertionSort(arr, left, right) {
    var i := left + 1
    while (i <= right) {
        def key := arr[i]
        var j := i - 1
        while (j >= left && arr[j] > key) {
            arr[j+1] := arr[j]
            j -= 1
        }
        arr[j+1] := key
        i += 1
    }
}

def merge(arr, left, mid, right) {
    def lp := arr.run(left, mid+1)
    def rp := arr.run(mid+1, right+1)
    var i := 0; var j := 0; var k := left
    while (i < lp.size() && j < rp.size()) {
        if (lp[i] <= rp[j]) { arr[k] := lp[i]; i += 1 }
        else { arr[k] := rp[j]; j += 1 }
        k += 1
    }
    while (i < lp.size()) { arr[k] := lp[i]; i += 1; k += 1 }
    while (j < rp.size()) { arr[k] := rp[j]; j += 1; k += 1 }
}

def timsort(arr) {
    def n := arr.size()
    var i := 0
    while (i < n) {
        def right := (i + minRun - 1).min(n - 1)
        insertionSort(arr, i, right)
        i += minRun
    }
    var size := minRun
    while (size < n) {
        var left := 0
        while (left < n) {
            def mid := (left + size - 1).min(n - 1)
            def right := (left + 2 * size - 1).min(n - 1)
            if (mid < right) { merge(arr, left, mid, right) }
            left += 2 * size
        }
        size *= 2
    }
    arr
}

def arr := [5, 2, 8, 1, 9, 3, 7, 4, 6].diverge()
println(timsort(arr))

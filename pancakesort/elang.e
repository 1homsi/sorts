def flip(arr, k) {
    var left := 0
    var right := k
    while (left < right) {
        def tmp := arr[left]
        arr[left] := arr[right]
        arr[right] := tmp
        left += 1
        right -= 1
    }
}

def findMaxIdx(arr, size) {
    var maxIdx := 0
    var i := 1
    while (i < size) {
        if (arr[i] > arr[maxIdx]) { maxIdx := i }
        i += 1
    }
    maxIdx
}

def pancakeSort(arr) {
    var size := arr.size()
    while (size > 1) {
        def maxIdx := findMaxIdx(arr, size)
        if (maxIdx != size - 1) {
            if (maxIdx != 0) { flip(arr, maxIdx) }
            flip(arr, size - 1)
        }
        size -= 1
    }
    arr
}

def arr := [3, 6, 2, 7, 4, 1, 5].diverge()
println(pancakeSort(arr))

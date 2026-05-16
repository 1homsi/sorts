def flip(arr, k) {
    def left = 0, right = k
    while (left < right) {
        def tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp
        left++; right--
    }
}

def pancakeSort(arr) {
    def n = arr.size()
    for (def size = n; size > 1; size--) {
        def maxIdx = 0
        for (def i = 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx)
            flip(arr, size - 1)
        }
    }
    arr
}

def arr = [3, 6, 2, 7, 4, 1, 5]
println pancakeSort(arr)

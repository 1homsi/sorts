class PancakeSort {
    static flip(arr, k) {
        var left = 0
        var right = k
        while (left < right) {
            var tmp = arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left = left + 1
            right = right - 1
        }
    }

    static sort(arr) {
        var size = arr.count
        while (size > 1) {
            var maxIdx = 0
            for (i in 1...size) {
                if (arr[i] > arr[maxIdx]) maxIdx = i
            }
            if (maxIdx != size - 1) {
                if (maxIdx != 0) flip(arr, maxIdx)
                flip(arr, size - 1)
            }
            size = size - 1
        }
        return arr
    }
}

var arr = [3, 6, 2, 7, 4, 1, 5]
System.print(PancakeSort.sort(arr))

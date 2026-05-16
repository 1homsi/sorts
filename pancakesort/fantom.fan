class PancakeSort {
    static Void flip(Int[] arr, Int k) {
        left := 0
        right := k
        while (left < right) {
            tmp := arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left++
            right--
        }
    }

    static Int findMaxIdx(Int[] arr, Int size) {
        maxIdx := 0
        for (i := 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i
        }
        return maxIdx
    }

    static Int[] sort(Int[] arr) {
        size := arr.size
        while (size > 1) {
            maxIdx := findMaxIdx(arr, size)
            if (maxIdx != size - 1) {
                if (maxIdx != 0) flip(arr, maxIdx)
                flip(arr, size - 1)
            }
            size--
        }
        return arr
    }

    static Void main() {
        arr := [3, 6, 2, 7, 4, 1, 5]
        echo(sort(arr))
    }
}

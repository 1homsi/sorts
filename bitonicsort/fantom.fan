class BitonicSort {
    static Void compareAndSwap(Int[] arr, Int i, Int j, Bool direction) {
        if (direction == (arr[i] > arr[j])) {
            tmp := arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
        }
    }

    static Void bitonicMerge(Int[] arr, Int lo, Int cnt, Bool direction) {
        if (cnt > 1) {
            k := cnt / 2
            for (i := lo; i < lo + k; ++i) {
                compareAndSwap(arr, i, i + k, direction)
            }
            bitonicMerge(arr, lo, k, direction)
            bitonicMerge(arr, lo + k, k, direction)
        }
    }

    static Void bitonicSort(Int[] arr, Int lo, Int cnt, Bool direction) {
        if (cnt > 1) {
            k := cnt / 2
            bitonicSort(arr, lo, k, true)
            bitonicSort(arr, lo + k, k, false)
            bitonicMerge(arr, lo, cnt, direction)
        }
    }

    static Void main() {
        data := Int[3, 7, 4, 8, 6, 2, 1, 5]
        bitonicSort(data, 0, data.size, true)
        echo(data)
    }
}

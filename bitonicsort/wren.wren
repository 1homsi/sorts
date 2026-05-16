class BitonicSort {
    static compareAndSwap(arr, i, j, direction) {
        if (direction == (arr[i] > arr[j])) {
            var tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
        }
    }

    static bitonicMerge(arr, lo, cnt, direction) {
        if (cnt > 1) {
            var k = (cnt / 2).floor
            for (i in lo...lo + k) {
                compareAndSwap(arr, i, i + k, direction)
            }
            bitonicMerge(arr, lo, k, direction)
            bitonicMerge(arr, lo + k, k, direction)
        }
    }

    static bitonicSort(arr, lo, cnt, direction) {
        if (cnt > 1) {
            var k = (cnt / 2).floor
            bitonicSort(arr, lo, k, true)
            bitonicSort(arr, lo + k, k, false)
            bitonicMerge(arr, lo, cnt, direction)
        }
    }
}

var data = [3, 7, 4, 8, 6, 2, 1, 5]
BitonicSort.bitonicSort(data, 0, data.count, true)
System.print(data)

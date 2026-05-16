class BitonicSort {
    def static compareAndSwap(int[] arr, int i, int j, boolean direction) {
        if (direction == (arr.get(i) > arr.get(j))) {
            val tmp = arr.get(i)
            arr.set(i, arr.get(j))
            arr.set(j, tmp)
        }
    }

    def static bitonicMerge(int[] arr, int lo, int cnt, boolean direction) {
        if (cnt > 1) {
            val k = cnt / 2
            for (i : lo ..< lo + k) {
                compareAndSwap(arr, i, i + k, direction)
            }
            bitonicMerge(arr, lo, k, direction)
            bitonicMerge(arr, lo + k, k, direction)
        }
    }

    def static bitonicSort(int[] arr, int lo, int cnt, boolean direction) {
        if (cnt > 1) {
            val k = cnt / 2
            bitonicSort(arr, lo, k, true)
            bitonicSort(arr, lo + k, k, false)
            bitonicMerge(arr, lo, cnt, direction)
        }
    }

    def static main(String[] args) {
        val data = #[3, 7, 4, 8, 6, 2, 1, 5]
        bitonicSort(data, 0, data.length, true)
        println(data)
    }
}

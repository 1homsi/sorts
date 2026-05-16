class TimSort {
    static val MIN_RUN = 32

    def static insertionSort(int[] arr, int left, int right) {
        for (var i = left + 1; i <= right; i++) {
            val key = arr.get(i)
            var j = i - 1
            while (j >= left && arr.get(j) > key) {
                arr.set(j + 1, arr.get(j))
                j--
            }
            arr.set(j + 1, key)
        }
    }

    def static merge(int[] arr, int left, int mid, int right) {
        val lp = arr.subList(left, mid + 1).toIntArray
        val rp = arr.subList(mid + 1, right + 1).toIntArray
        var i = 0; var j = 0; var k = left
        while (i < lp.length && j < rp.length) {
            if (lp.get(i) <= rp.get(j)) arr.set(k++, lp.get(i++))
            else arr.set(k++, rp.get(j++))
        }
        while (i < lp.length) arr.set(k++, lp.get(i++))
        while (j < rp.length) arr.set(k++, rp.get(j++))
    }

    def static timsort(int[] arr) {
        val n = arr.length
        var i = 0
        while (i < n) {
            insertionSort(arr, i, Math.min(i + MIN_RUN - 1, n - 1))
            i += MIN_RUN
        }
        var size = MIN_RUN
        while (size < n) {
            var left = 0
            while (left < n) {
                val mid = Math.min(left + size - 1, n - 1)
                val right = Math.min(left + 2 * size - 1, n - 1)
                if (mid < right) merge(arr, left, mid, right)
                left += 2 * size
            }
            size *= 2
        }
        arr
    }

    def static main(String[] args) {
        val arr = #[5, 2, 8, 1, 9, 3, 7, 4, 6]
        println(timsort(arr).join(", "))
    }
}

class StoogeSort {
    def static void stoogeSort(int[] arr, int first, int last) {
        if (arr.get(first) > arr.get(last)) {
            val tmp = arr.get(first)
            arr.set(first, arr.get(last))
            arr.set(last, tmp)
        }
        val n = last - first + 1
        if (n > 2) {
            val t = n * 2 / 3
            stoogeSort(arr, first, first + t - 1)
            stoogeSort(arr, last - t + 1, last)
            stoogeSort(arr, first, first + t - 1)
        }
    }

    def static void main(String[] args) {
        val arr = #[3, 1, 4, 1, 5, 9, 2, 6]
        stoogeSort(arr, 0, arr.length - 1)
        println(arr)
    }
}

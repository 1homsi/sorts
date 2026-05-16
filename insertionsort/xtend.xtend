def static insertionSort(int[] arr) {
    val n = arr.length
    for (var i = 1; i < n; i++) {
        val key = arr.get(i)
        var j = i - 1
        while (j >= 0 && arr.get(j) > key) {
            arr.set(j + 1, arr.get(j))
            j--
        }
        arr.set(j + 1, key)
    }
    arr
}

def static int[] selectionSort(int[] arr) {
    val n = arr.length
    for (var i = 0; i < n; i++) {
        var minIdx = i
        for (var j = i + 1; j < n; j++) {
            if (arr.get(j) < arr.get(minIdx)) minIdx = j
        }
        val tmp = arr.get(i)
        arr.set(i, arr.get(minIdx))
        arr.set(minIdx, tmp)
    }
    arr
}

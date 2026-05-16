fun selectionSort(arr: IntArray): IntArray {
    val n = arr.size
    for (i in 0 until n) {
        var minIdx = i
        for (j in i + 1 until n) {
            if (arr[j] < arr[minIdx]) minIdx = j
        }
        val temp = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = temp
    }
    return arr
}

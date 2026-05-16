fun compareAndSwap(arr: IntArray, i: Int, j: Int, direction: Boolean) {
    if (direction == (arr[i] > arr[j])) {
        val tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp
    }
}

fun bitonicMerge(arr: IntArray, lo: Int, cnt: Int, direction: Boolean) {
    if (cnt > 1) {
        val k = cnt / 2
        for (i in lo until lo + k) compareAndSwap(arr, i, i + k, direction)
        bitonicMerge(arr, lo, k, direction)
        bitonicMerge(arr, lo + k, k, direction)
    }
}

fun bitonicSort(arr: IntArray, lo: Int, cnt: Int, direction: Boolean) {
    if (cnt > 1) {
        val k = cnt / 2
        bitonicSort(arr, lo, k, true)
        bitonicSort(arr, lo + k, k, false)
        bitonicMerge(arr, lo, cnt, direction)
    }
}

fun main() {
    val data = intArrayOf(3, 7, 4, 8, 6, 2, 1, 5)
    bitonicSort(data, 0, data.size, true)
    println(data.toList())
}

fun stoogeSort(arr: IntArray, first: Int, last: Int) {
    if (arr[first] > arr[last]) {
        val tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    }
    if (last - first + 1 > 2) {
        val t = (last - first + 1) * 2 / 3
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)
    }
}

fun main() {
    val arr = intArrayOf(3, 1, 4, 1, 5, 9, 2, 6)
    stoogeSort(arr, 0, arr.size - 1)
    println(arr.toList())
}

const val MIN_RUN = 32

fun insertionSort(arr: IntArray, left: Int, right: Int) {
    for (i in left + 1..right) {
        val key = arr[i]
        var j = i - 1
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = key
    }
}

fun merge(arr: IntArray, left: Int, mid: Int, right: Int) {
    val leftPart = arr.copyOfRange(left, mid + 1)
    val rightPart = arr.copyOfRange(mid + 1, right + 1)
    var i = 0; var j = 0; var k = left
    while (i < leftPart.size && j < rightPart.size) {
        if (leftPart[i] <= rightPart[j]) arr[k++] = leftPart[i++]
        else arr[k++] = rightPart[j++]
    }
    while (i < leftPart.size) arr[k++] = leftPart[i++]
    while (j < rightPart.size) arr[k++] = rightPart[j++]
}

fun timsort(arr: IntArray) {
    val n = arr.size
    var i = 0
    while (i < n) {
        insertionSort(arr, i, minOf(i + MIN_RUN - 1, n - 1))
        i += MIN_RUN
    }
    var size = MIN_RUN
    while (size < n) {
        var left = 0
        while (left < n) {
            val mid = minOf(left + size - 1, n - 1)
            val right = minOf(left + 2 * size - 1, n - 1)
            if (mid < right) merge(arr, left, mid, right)
            left += 2 * size
        }
        size *= 2
    }
}

fun main() {
    val arr = intArrayOf(5, 2, 8, 1, 9, 3, 7, 4, 6)
    timsort(arr)
    println(arr.toList())
}

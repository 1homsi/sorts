fun bubbleSort(arr: IntArray) {
    var n = arr.size
    var swapped: Boolean
    do {
        swapped = false
        for (i in 0 until n - 1) {
            if (arr[i] > arr[i + 1]) {
                val tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            }
        }
        n--
    } while (swapped)
}

fun main() {
    val arr = intArrayOf(64, 34, 25, 12, 22, 11, 90)
    bubbleSort(arr)
    println(arr.toList())
}

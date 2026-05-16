fun flip(arr: IntArray, k: Int) {
    var left = 0; var right = k
    while (left < right) {
        val tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp
        left++; right--
    }
}

fun pancakeSort(arr: IntArray) {
    var size = arr.size
    while (size > 1) {
        var maxIdx = 0
        for (i in 1 until size) {
            if (arr[i] > arr[maxIdx]) maxIdx = i
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx)
            flip(arr, size - 1)
        }
        size--
    }
}

fun main() {
    val arr = intArrayOf(3, 6, 2, 7, 4, 1, 5)
    pancakeSort(arr)
    println(arr.toList())
}

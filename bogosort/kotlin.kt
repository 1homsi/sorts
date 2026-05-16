fun isSorted(arr: IntArray): Boolean {
    for (i in 0 until arr.size - 1) {
        if (arr[i] > arr[i + 1]) return false
    }
    return true
}

fun bogosort(arr: IntArray): IntArray {
    val list = arr.toMutableList()
    while (!isSorted(list.toIntArray())) {
        list.shuffle()
    }
    return list.toIntArray()
}

fun main() {
    val arr = intArrayOf(3, 1, 4, 1, 5, 9, 2, 6)
    println(bogosort(arr).toList())
}

fun mergeSort(arr: List<Int>): List<Int> {
    if (arr.size <= 1) return arr
    val mid = arr.size / 2
    val left = mergeSort(arr.subList(0, mid))
    val right = mergeSort(arr.subList(mid, arr.size))
    return merge(left, right)
}

fun merge(left: List<Int>, right: List<Int>): List<Int> {
    val result = mutableListOf<Int>()
    var i = 0
    var j = 0
    while (i < left.size && j < right.size) {
        if (left[i] <= right[j]) result.add(left[i++])
        else result.add(right[j++])
    }
    while (i < left.size) result.add(left[i++])
    while (j < right.size) result.add(right[j++])
    return result
}

fun main() {
    val arr = listOf(38, 27, 43, 3, 9, 82, 10)
    println(mergeSort(arr))
}

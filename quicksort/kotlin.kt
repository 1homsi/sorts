fun quicksort(arr: List<Int>): List<Int> {
    if (arr.size <= 1) return arr
    val pivot = arr[arr.size / 2]
    val left = arr.filter { it < pivot }
    val middle = arr.filter { it == pivot }
    val right = arr.filter { it > pivot }
    return quicksort(left) + middle + quicksort(right)
}

fun main() {
    println(quicksort(listOf(3, 6, 8, 10, 1, 2, 1)))
}

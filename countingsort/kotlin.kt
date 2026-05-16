fun countingSort(arr: IntArray): IntArray {
    if (arr.isEmpty()) return arr
    val max = arr.max()!!
    val min = arr.min()!!
    val range = max - min + 1
    val count = IntArray(range)
    for (v in arr) count[v - min]++
    for (i in 1 until range) count[i] += count[i - 1]
    val output = IntArray(arr.size)
    for (i in arr.indices.reversed()) {
        output[--count[arr[i] - min]] = arr[i]
    }
    return output
}

fun main() {
    println(countingSort(intArrayOf(4, 2, 2, 8, 3, 3, 1)).toList())
}

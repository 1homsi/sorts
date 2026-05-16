fun countingSort(arr: IntArray, exp: Int) {
    val n = arr.size
    val output = IntArray(n)
    val count = IntArray(10)
    for (i in 0 until n) count[(arr[i] / exp) % 10]++
    for (i in 1 until 10) count[i] += count[i - 1]
    for (i in n - 1 downTo 0) {
        val idx = (arr[i] / exp) % 10
        output[--count[idx]] = arr[i]
    }
    output.copyInto(arr)
}

fun radixSort(arr: IntArray) {
    if (arr.isEmpty()) return
    val max = arr.max()!!
    var exp = 1
    while (max / exp > 0) {
        countingSort(arr, exp)
        exp *= 10
    }
}

fun main() {
    val arr = intArrayOf(170, 45, 75, 90, 802, 24, 2, 66)
    radixSort(arr)
    println(arr.toList())
}

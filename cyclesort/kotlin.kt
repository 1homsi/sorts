fun cycleSort(arr: IntArray): Int {
    var writes = 0
    val n = arr.size
    for (cycleStart in 0 until n - 1) {
        var item = arr[cycleStart]
        var pos = cycleStart
        for (i in cycleStart + 1 until n) {
            if (arr[i] < item) pos++
        }
        if (pos == cycleStart) continue
        while (item == arr[pos]) pos++
        val tmp = arr[pos]; arr[pos] = item; item = tmp
        writes++
        while (pos != cycleStart) {
            pos = cycleStart
            for (i in cycleStart + 1 until n) {
                if (arr[i] < item) pos++
            }
            while (item == arr[pos]) pos++
            val t = arr[pos]; arr[pos] = item; item = t
            writes++
        }
    }
    return writes
}

fun main() {
    val arr = intArrayOf(5, 4, 3, 2, 1)
    cycleSort(arr)
    println(arr.toList())
}

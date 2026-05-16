fun insertionSort(bucket: MutableList<Double>) {
    for (i in 1 until bucket.size) {
        val key = bucket[i]
        var j = i - 1
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j]
            j--
        }
        bucket[j + 1] = key
    }
}

fun bucketSort(arr: DoubleArray): DoubleArray {
    val n = arr.size
    if (n == 0) return arr
    val min = arr.min()!!
    val max = arr.max()!!
    val buckets = Array(n) { mutableListOf<Double>() }
    for (num in arr) {
        var idx = ((num - min) / (max - min + 1) * n).toInt()
        if (idx >= n) idx = n - 1
        buckets[idx].add(num)
    }
    return buckets.flatMap { bucket ->
        insertionSort(bucket)
        bucket
    }.toDoubleArray()
}

fun main() {
    println(bucketSort(doubleArrayOf(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)).toList())
}

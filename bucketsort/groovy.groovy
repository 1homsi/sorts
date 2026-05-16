def insertionSort(List bucket) {
    for (int i = 1; i < bucket.size(); i++) {
        def key = bucket[i]
        int j = i - 1
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j]
            j--
        }
        bucket[j + 1] = key
    }
    bucket
}

def bucketSort(List arr) {
    int n = arr.size()
    if (n == 0) return arr
    def min = arr.min()
    def max = arr.max()
    def buckets = (0..<n).collect { [] }
    arr.each { num ->
        int idx = (int)(((num - min) / (max - min + 1)) * n)
        if (idx >= n) idx = n - 1
        buckets[idx] << num
    }
    buckets.collectMany { insertionSort(it) }
}

println bucketSort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])

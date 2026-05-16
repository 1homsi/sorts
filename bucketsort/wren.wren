class BucketSort {
    static insertionSort(bucket) {
        var n = bucket.count
        for (i in 1...n) {
            var key = bucket[i]
            var j = i - 1
            while (j >= 0 && bucket[j] > key) {
                bucket[j + 1] = bucket[j]
                j = j - 1
            }
            bucket[j + 1] = key
        }
        return bucket
    }

    static sort(arr) {
        var n = arr.count
        if (n == 0) return arr
        var minV = arr[0]
        var maxV = arr[0]
        for (v in arr) {
            if (v < minV) minV = v
            if (v > maxV) maxV = v
        }
        var buckets = List.filled(n, null)
        for (i in 0...n) buckets[i] = []
        for (num in arr) {
            var idx = ((num - minV) / (maxV - minV + 1) * n).floor
            if (idx >= n) idx = n - 1
            buckets[idx].add(num)
        }
        var result = []
        for (bucket in buckets) {
            for (v in BucketSort.insertionSort(bucket)) result.add(v)
        }
        return result
    }
}

var data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
System.print(BucketSort.sort(data))

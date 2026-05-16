class BucketSort {
    static Float[] insertionSort(Float[] bucket) {
        n := bucket.size
        for (i := 1; i < n; i++) {
            key := bucket[i]
            j := i - 1
            while (j >= 0 && bucket[j] > key) {
                bucket[j + 1] = bucket[j]
                j--
            }
            bucket[j + 1] = key
        }
        return bucket
    }

    static Float[] bucketSort(Float[] arr) {
        n := arr.size
        if (n == 0) return arr
        minV := arr.min |a, b| { a <=> b }
        maxV := arr.max |a, b| { a <=> b }
        buckets := Float[][,].make(n) |->Float[]| { Float[,] }
        arr.each |num| {
            idx := ((num - minV) / (maxV - minV + 1f) * n).toInt
            if (idx >= n) idx = n - 1
            buckets[idx].add(num)
        }
        result := Float[,]
        buckets.each |b| {
            insertionSort(b).each |v| { result.add(v) }
        }
        return result
    }

    static Void main() {
        data := [0.78f, 0.17f, 0.39f, 0.26f, 0.72f, 0.94f, 0.21f, 0.12f, 0.23f, 0.68f]
        echo(bucketSort(data))
    }
}

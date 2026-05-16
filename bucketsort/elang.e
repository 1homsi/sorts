def insertionSort(var bucket) {
    def n := bucket.size()
    for i in 1..!n {
        def key := bucket[i]
        var j := i - 1
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] := bucket[j]
            j -= 1
        }
        bucket[j + 1] := key
    }
    bucket
}

def bucketSort(arr) {
    def n := arr.size()
    if (n == 0) { return arr }
    var minV := arr[0]
    var maxV := arr[0]
    for v in arr {
        if (v < minV) { minV := v }
        if (v > maxV) { maxV := v }
    }
    def buckets := ([].diverge()).diverge()
    for _ in 0..!n { buckets.push([].diverge()) }
    for num in arr {
        var idx := ((num - minV) / (maxV - minV + 1) * n).floor()
        if (idx >= n) { idx := n - 1 }
        buckets[idx].push(num)
    }
    def result := [].diverge()
    for bucket in buckets {
        for v in insertionSort(bucket.snapshot()) { result.push(v) }
    }
    result.snapshot()
}

def data := [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
println(bucketSort(data))

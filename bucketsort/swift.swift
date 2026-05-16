func insertionSort(_ bucket: inout [Double]) {
    for i in 1..<bucket.count {
        let key = bucket[i]
        var j = i - 1
        while j >= 0 && bucket[j] > key {
            bucket[j + 1] = bucket[j]
            j -= 1
        }
        bucket[j + 1] = key
    }
}

func bucketSort(_ arr: [Double]) -> [Double] {
    let n = arr.count
    guard n > 0 else { return arr }
    let min = arr.min()!
    let max = arr.max()!
    var buckets = [[Double]](repeating: [], count: n)
    for num in arr {
        var idx = Int((num - min) / (max - min + 1) * Double(n))
        if idx >= n { idx = n - 1 }
        buckets[idx].append(num)
    }
    return buckets.flatMap { bucket -> [Double] in
        var b = bucket
        insertionSort(&b)
        return b
    }
}

print(bucketSort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]))

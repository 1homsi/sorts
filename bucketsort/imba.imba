def insertionSort(bucket)
    var n = bucket.length
    for var i = 1; i < n; i++
        var key = bucket[i]
        var j = i - 1
        while j >= 0 and bucket[j] > key
            bucket[j + 1] = bucket[j]
            j--
        bucket[j + 1] = key
    bucket

def bucketSort(arr)
    var n = arr.length
    return arr if n == 0
    var minV = Math.min(...arr)
    var maxV = Math.max(...arr)
    var buckets = for var i = 0; i < n; i++ do []
    for var num of arr
        var idx = Math.floor((num - minV) / (maxV - minV + 1) * n)
        idx = n - 1 if idx >= n
        buckets[idx].push(num)
    var result = []
    for var bucket of buckets
        for var v of insertionSort(bucket)
            result.push(v)
    result

var data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
console.log(bucketSort(data))

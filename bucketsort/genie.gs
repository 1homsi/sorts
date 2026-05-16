[indent=4]
uses GLib

def insertion_sort(bucket: array of double, n: int)
    for var i = 1 to (n - 1)
        var key = bucket[i]
        var j = i - 1
        while j >= 0 and bucket[j] > key
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key

def bucket_sort(arr: array of double): array of double
    var n = arr.length
    if n == 0 do return arr
    var min_v = arr[0]
    var max_v = arr[0]
    for var v in arr
        if v < min_v do min_v = v
        if v > max_v do max_v = v
    var buckets = new array of (array of double)[n]
    var counts = new array of int[n]
    for var i = 0 to (n - 1)
        buckets[i] = new array of double[n]
        counts[i] = 0
    for var num in arr
        var idx = (int)((num - min_v) / (max_v - min_v + 1) * n)
        if idx >= n do idx = n - 1
        buckets[idx][counts[idx]++] = num
    var result = new array of double[n]
    var pos = 0
    for var b = 0 to (n - 1)
        insertion_sort(buckets[b], counts[b])
        for var i = 0 to (counts[b] - 1)
            result[pos++] = buckets[b][i]
    return result

init
    var data = new array of double = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
    var sorted = bucket_sort(data)
    for var v in sorted
        stdout.printf("%.2f ", v)
    stdout.printf("\n")

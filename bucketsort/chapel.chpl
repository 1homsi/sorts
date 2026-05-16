use List;

proc insertionSort(ref bucket: list(real)) {
    var n = bucket.size;
    for i in 1..<n {
        var key = bucket[i];
        var j = i - 1;
        while j >= 0 && bucket[j] > key {
            bucket[j + 1] = bucket[j];
            j -= 1;
        }
        bucket[j + 1] = key;
    }
}

proc bucketSort(arr: [] real): [] real {
    var n = arr.size;
    if n == 0 then return arr;
    var minV = min reduce arr;
    var maxV = max reduce arr;
    var buckets: [0..<n] list(real);
    for num in arr {
        var idx = floor((num - minV) / (maxV - minV + 1) * n): int;
        if idx >= n then idx = n - 1;
        buckets[idx].append(num);
    }
    var result: list(real);
    for ref bucket in buckets {
        insertionSort(bucket);
        for v in bucket do result.append(v);
    }
    var arr2: [0..<result.size] real;
    for i in 0..<result.size do arr2[i] = result[i];
    return arr2;
}

var data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
writeln(bucketSort(data));

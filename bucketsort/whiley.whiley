import whiley.lang.*

function insertion_sort(real[] bucket) -> real[]:
    int n = |bucket|
    int i = 1
    while i < n:
        real key = bucket[i]
        int j = i - 1
        while j >= 0 && bucket[j] > key:
            bucket[j + 1] = bucket[j]
            j = j - 1
        bucket[j + 1] = key
        i = i + 1
    return bucket

function bucket_sort(real[] arr) -> real[]:
    int n = |arr|
    if n == 0:
        return arr
    real minV = arr[0]
    real maxV = arr[0]
    int i = 0
    while i < n:
        if arr[i] < minV: minV = arr[i]
        if arr[i] > maxV: maxV = arr[i]
        i = i + 1
    real[][] buckets = new real[][n]
    int[] counts = new int[n]
    i = 0
    while i < n:
        real num = arr[i]
        int idx = (int)((num - minV) / (maxV - minV + 1) * n)
        if idx >= n: idx = n - 1
        buckets[idx][counts[idx]] = num
        counts[idx] = counts[idx] + 1
        i = i + 1
    real[] result = new real[n]
    int pos = 0
    int b = 0
    while b < n:
        real[] bkt = insertion_sort(buckets[b][0..counts[b]])
        i = 0
        while i < |bkt|:
            result[pos] = bkt[i]
            pos = pos + 1
            i = i + 1
        b = b + 1
    return result

method main(System.Console console):
    real[] data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
    real[] sorted = bucket_sort(data)
    console.out.println(sorted)

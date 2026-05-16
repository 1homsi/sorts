def bucket_sort(arr: [int], maxVal: int) -> [int] {
    mut buckets: [[int]] = []
    for i in range(0, maxVal) {
        buckets.append([])
    }
    for num in arr {
        if num >= 0 and num < maxVal {
            buckets[num].append(num)
        }
    }
    mut result: [int] = []
    for bucket in buckets {
        for num in bucket {
            result.append(num)
        }
    }
    return result
}
print(bucket_sort([5, 2, 8, 1, 9, 3], 10))
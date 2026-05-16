func bucketSort(arr, maxVal) {
    buckets = array(0, maxVal);
    for (i = 1; i <= numberof(arr); i++) {
        num = arr(i);
        if (num >= 0 && num < maxVal) {
            if (is_void(buckets(num))) buckets(num) = [];
            buckets(num) = [buckets(num), num];
        }
    }
    result = [];
    for (i = 1; i <= numberof(buckets); i++) {
        if (!is_void(buckets(i))) {
            result = [result, buckets(i)];
        }
    }
    return result;
}
print, bucketSort([5, 2, 8, 1, 9, 3], 10);
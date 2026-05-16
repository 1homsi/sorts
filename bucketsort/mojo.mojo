from python import Python

fn insertion_sort(inout bucket: PythonObject) raises:
    var n = len(bucket)
    for i in range(1, n):
        var key = bucket[i]
        var j = i - 1
        while j >= 0 and bucket[j] > key:
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key

fn bucket_sort(arr: PythonObject) raises -> PythonObject:
    var builtins = Python.import_module("builtins")
    var n = len(arr)
    if n == 0:
        return arr
    var min_v = builtins.min(arr)
    var max_v = builtins.max(arr)
    var buckets = builtins.list()
    for _ in range(n):
        buckets.append(builtins.list())
    for i in range(n):
        var num = arr[i]
        var idx = builtins.int((num - min_v) / (max_v - min_v + 1) * n)
        if idx >= n:
            idx = n - 1
        buckets[idx].append(num)
    var result = builtins.list()
    for i in range(n):
        insertion_sort(buckets[i])
        result.extend(buckets[i])
    return result

fn main() raises:
    var builtins = Python.import_module("builtins")
    var data = builtins.list([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])
    var sorted = bucket_sort(data)
    print(sorted)

def insertion_sort: bucket {
    n = bucket size
    1 upto: (n - 1) do: |i| {
        key = bucket at: i
        j = i - 1
        { j >= 0 and: { (bucket at: j) > key } } while_true: {
            bucket at: (j + 1) put: (bucket at: j)
            j = j - 1
        }
        bucket at: (j + 1) put: key
    }
    bucket
}

def bucket_sort: arr {
    n = arr size
    n == 0 if_true: { return arr }
    min_v = arr min
    max_v = arr max
    buckets = (1 to: n) map: |_| { [] }
    arr each: |num| {
        idx = ((num - min_v) / (max_v - min_v + 1) * n) to_i
        idx >= n if_true: { idx = n - 1 }
        (buckets at: idx) push: num
    }
    result = []
    buckets each: |b| {
        (insertion_sort: b) each: |v| { result push: v }
    }
    result
}

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
(bucket_sort: data) println

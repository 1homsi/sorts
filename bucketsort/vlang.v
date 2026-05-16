module main

fn insertion_sort(mut bucket []f64) {
    n := bucket.len
    for i in 1..n {
        key := bucket[i]
        mut j := i - 1
        for j >= 0 && bucket[j] > key {
            bucket[j + 1] = bucket[j]
            j--
        }
        bucket[j + 1] = key
    }
}

fn bucket_sort(arr []f64) []f64 {
    n := arr.len
    if n == 0 { return arr }
    mut min_v := arr[0]
    mut max_v := arr[0]
    for v in arr {
        if v < min_v { min_v = v }
        if v > max_v { max_v = v }
    }
    mut buckets := [][]f64{len: n, init: []f64{}}
    for num in arr {
        mut idx := int((num - min_v) / (max_v - min_v + 1) * f64(n))
        if idx >= n { idx = n - 1 }
        buckets[idx] << num
    }
    mut result := []f64{}
    for mut bucket in buckets {
        insertion_sort(mut bucket)
        result << bucket
    }
    return result
}

fn main() {
    data := [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
    println(bucket_sort(data))
}

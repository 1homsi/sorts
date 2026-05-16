package main

import "core:fmt"
import "core:math"

insertion_sort :: proc(bucket: ^[dynamic]f64) {
    n := len(bucket)
    for i in 1..<n {
        key := bucket[i]
        j := i - 1
        for j >= 0 && bucket[j] > key {
            bucket[j + 1] = bucket[j]
            j -= 1
        }
        bucket[j + 1] = key
    }
}

bucket_sort :: proc(arr: []f64) -> [dynamic]f64 {
    n := len(arr)
    if n == 0 { return {} }
    min_v, max_v := arr[0], arr[0]
    for v in arr {
        if v < min_v { min_v = v }
        if v > max_v { max_v = v }
    }
    buckets := make([dynamic][dynamic]f64, n)
    defer delete(buckets)
    for num in arr {
        idx := int((num - min_v) / (max_v - min_v + 1) * f64(n))
        if idx >= n { idx = n - 1 }
        append(&buckets[idx], num)
    }
    result := make([dynamic]f64)
    for &bucket in buckets {
        insertion_sort(&bucket)
        for v in bucket { append(&result, v) }
        delete(bucket)
    }
    return result
}

main :: proc() {
    data := []f64{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
    sorted := bucket_sort(data)
    defer delete(sorted)
    fmt.println(sorted[:])
}

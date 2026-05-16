use fmt;
use types;

export fn bucket_sort(arr: []int, max_val: int) []int = {
    let buckets: [10][]int = [[], [], [], [], [], [], [], [], [], []];
    for (num in arr) {
        if (num >= 0 && num < max_val) {
            append(buckets[num], num);
        }
    }
    let result: []int = [];
    for (bucket in buckets) {
        for (num in bucket) {
            append(result, num);
        }
    }
    return result;
};

export fn main() void = {
    fmt::println(bucket_sort([5, 2, 8, 1, 9, 3], 10))!;
};
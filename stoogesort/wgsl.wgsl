@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

fn stoogeSort(first: i32, last: i32) {
    if arr[first] > arr[last] {
        let tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    let n = last - first + 1;
    if n > 2 {
        let t = n * 2 / 3;
        stoogeSort(first, first + t - 1);
        stoogeSort(last - t + 1, last);
        stoogeSort(first, first + t - 1);
    }
}

@compute @workgroup_size(1)
fn main() {
    stoogeSort(0, 7);
}

use fmt;

fn heapsort(arr: []int) void = {
    let n = len(arr);
    for (let i = n / 2 - 1; i >= 0; i -= 1) {
        siftdown(arr, i, n);
    };
    for (let i = n - 1; i > 0; i -= 1) {
        let temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        siftdown(arr, 0, i);
    };
};

fn siftdown(arr: []int, idx: int, n: int) void = {
    let largest = idx;
    let left = 2 * idx + 1;
    let right = 2 * idx + 2;
    
    if (left < n && arr[left] > arr[largest]) {
        largest = left;
    };
    if (right < n && arr[right] > arr[largest]) {
        largest = right;
    };
    if (largest != idx) {
        let temp = arr[idx];
        arr[idx] = arr[largest];
        arr[largest] = temp;
        siftdown(arr, largest, n);
    };
};

export fn main() void = {
    let arr = [5, 2, 8, 1, 9, 3];
    heapsort(arr);
    for (let i = 0; i < len(arr); i += 1) {
        fmt::println(arr[i]);
    };
};

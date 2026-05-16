@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

fn heapify(n: i32, i: i32) {
    var largest = i;
    let left = 2 * i + 1;
    let right = 2 * i + 2;
    if (left < n && arr[left] > arr[largest]) { largest = left; }
    if (right < n && arr[right] > arr[largest]) { largest = right; }
    if (largest != i) {
        let tmp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = tmp;
        heapify(n, largest);
    }
}

@compute @workgroup_size(1)
fn heapsort_build(@builtin(global_invocation_id) id: vec3<u32>) {
    let n = i32(arrayLength(&arr));
    var i = n / 2 - 1;
    loop {
        if (i < 0) { break; }
        heapify(n, i);
        i = i - 1;
    }
    i = n - 1;
    loop {
        if (i <= 0) { break; }
        let tmp = arr[0];
        arr[0] = arr[i];
        arr[i] = tmp;
        heapify(i, 0);
        i = i - 1;
    }
}

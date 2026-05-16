@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

fn flip(k: i32) {
    var left: i32 = 0;
    var right: i32 = k;
    loop {
        if left >= right { break; }
        let tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left += 1;
        right -= 1;
    }
}

fn find_max_idx(size: i32) -> i32 {
    var max_idx: i32 = 0;
    var i: i32 = 1;
    loop {
        if i >= size { break; }
        if arr[i] > arr[max_idx] { max_idx = i; }
        i += 1;
    }
    return max_idx;
}

@compute @workgroup_size(1)
fn main() {
    var size: i32 = 7;
    loop {
        if size <= 1 { break; }
        let max_idx = find_max_idx(size);
        if max_idx != size - 1 {
            if max_idx != 0 { flip(max_idx); }
            flip(size - 1);
        }
        size -= 1;
    }
}

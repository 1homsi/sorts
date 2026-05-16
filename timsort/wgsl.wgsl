@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

const MIN_RUN: i32 = 32;

fn insertion_sort(left: i32, right: i32) {
    var i = left + 1;
    loop {
        if i > right { break; }
        let key = arr[i];
        var j = i - 1;
        loop {
            if j < left || arr[j] <= key { break; }
            arr[j + 1] = arr[j];
            j -= 1;
        }
        arr[j + 1] = key;
        i += 1;
    }
}

fn merge(left: i32, mid: i32, right: i32) {
    var lp: array<i32, 256>;
    var rp: array<i32, 256>;
    let ln = mid - left + 1;
    let rn = right - mid;
    for (var k = 0; k < ln; k++) { lp[k] = arr[left + k]; }
    for (var k = 0; k < rn; k++) { rp[k] = arr[mid + 1 + k]; }
    var i = 0; var j = 0; var k = left;
    loop {
        if i >= ln || j >= rn { break; }
        if lp[i] <= rp[j] { arr[k] = lp[i]; i++; }
        else { arr[k] = rp[j]; j++; }
        k++;
    }
    loop { if i >= ln { break; } arr[k] = lp[i]; i++; k++; }
    loop { if j >= rn { break; } arr[k] = rp[j]; j++; k++; }
}

@compute @workgroup_size(1)
fn main() {
    let n: i32 = arrayLength(&arr);
    var i = 0;
    loop {
        if i >= n { break; }
        let right = min(i + MIN_RUN - 1, n - 1);
        insertion_sort(i, right);
        i += MIN_RUN;
    }
    var size = MIN_RUN;
    loop {
        if size >= n { break; }
        var left = 0;
        loop {
            if left >= n { break; }
            let mid = min(left + size - 1, n - 1);
            let right = min(left + 2 * size - 1, n - 1);
            if mid < right { merge(left, mid, right); }
            left += 2 * size;
        }
        size *= 2;
    }
}

@group(0) @binding(0) var<storage, read_write> arr: array<i32>;
@group(0) @binding(1) var<storage, read_write> tmp: array<i32>;
@group(0) @binding(2) var<uniform> n: u32;

fn merge_step(lo: i32, mid: i32, hi: i32) {
    var i = lo;
    var j = mid + 1;
    var k = lo;
    loop {
        if (i > mid || j > hi) { break; }
        if (arr[i] <= arr[j]) {
            tmp[k] = arr[i]; i++; k++;
        } else {
            tmp[k] = arr[j]; j++; k++;
        }
    }
    loop { if (i > mid) { break; } tmp[k] = arr[i]; i++; k++; }
    loop { if (j > hi) { break; } tmp[k] = arr[j]; j++; k++; }
    for (var x = lo; x <= hi; x++) { arr[x] = tmp[x]; }
}

fn merge_sort(lo: i32, hi: i32) {
    if (lo >= hi) { return; }
    let mid = (lo + hi) / 2;
    merge_sort(lo, mid);
    merge_sort(mid + 1, hi);
    merge_step(lo, mid, hi);
}

@compute @workgroup_size(1)
fn main() {
    merge_sort(0, i32(n) - 1);
}

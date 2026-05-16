@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

@compute @workgroup_size(1)
fn cocktailSort() {
    let n = arrayLength(&arr);
    var swapped: bool = true;
    var start: u32 = 0u;
    var end: u32 = n - 1u;
    var tmp: i32;
    loop {
        if (!swapped) { break; }
        swapped = false;
        var i: u32 = start;
        loop {
            if (i >= end) { break; }
            if (arr[i] > arr[i + 1u]) {
                tmp = arr[i];
                arr[i] = arr[i + 1u];
                arr[i + 1u] = tmp;
                swapped = true;
            }
            i = i + 1u;
        }
        if (!swapped) { break; }
        swapped = false;
        end = end - 1u;
        var j: u32 = end;
        loop {
            if (j <= start) { break; }
            j = j - 1u;
            if (arr[j] > arr[j + 1u]) {
                tmp = arr[j];
                arr[j] = arr[j + 1u];
                arr[j + 1u] = tmp;
                swapped = true;
            }
        }
        start = start + 1u;
    }
}

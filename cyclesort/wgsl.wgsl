@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

@compute @workgroup_size(1)
fn cycle_sort() {
    let n: i32 = 5;
    var writes: i32 = 0;
    var cycle_start: i32 = 0;
    loop {
        if cycle_start >= n - 1 { break; }
        var item: i32 = arr[cycle_start];
        var pos: i32 = cycle_start;
        var i: i32 = cycle_start + 1;
        loop {
            if i >= n { break; }
            if arr[i] < item { pos = pos + 1; }
            i = i + 1;
        }
        if pos != cycle_start {
            loop {
                if item != arr[pos] { break; }
                pos = pos + 1;
            }
            let tmp: i32 = arr[pos];
            arr[pos] = item;
            item = tmp;
            writes = writes + 1;
            loop {
                if pos == cycle_start { break; }
                pos = cycle_start;
                i = cycle_start + 1;
                loop {
                    if i >= n { break; }
                    if arr[i] < item { pos = pos + 1; }
                    i = i + 1;
                }
                loop {
                    if item != arr[pos] { break; }
                    pos = pos + 1;
                }
                let t: i32 = arr[pos];
                arr[pos] = item;
                item = t;
                writes = writes + 1;
            }
        }
        cycle_start = cycle_start + 1;
    }
}

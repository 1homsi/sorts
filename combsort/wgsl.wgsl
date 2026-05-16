@group(0) @binding(0) var<storage, read_write> arr: array<i32>;
@group(0) @binding(1) var<uniform> n: i32;

@compute @workgroup_size(1)
fn comb_sort() {
    var gap: i32 = n;
    var sorted: bool = false;
    loop {
        if sorted { break; }
        gap = i32(f32(gap) / 1.3);
        if gap <= 1 {
            gap = 1;
            sorted = true;
        }
        var i: i32 = 0;
        loop {
            if i + gap >= n { break; }
            if arr[i] > arr[i + gap] {
                let tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
            i += 1;
        }
    }
}

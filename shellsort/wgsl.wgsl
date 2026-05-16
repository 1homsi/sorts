@group(0) @binding(0) var<storage, read_write> arr: array<i32>;
@group(0) @binding(1) var<uniform> n: i32;

fn shellSort() {
    var gap: i32 = n / 2;
    loop {
        if gap <= 0 { break; }
        var i: i32 = gap;
        loop {
            if i >= n { break; }
            let temp: i32 = arr[i];
            var j: i32 = i;
            loop {
                if j < gap || arr[j - gap] <= temp { break; }
                arr[j] = arr[j - gap];
                j = j - gap;
            }
            arr[j] = temp;
            i = i + 1;
        }
        gap = gap / 2;
    }
}

@compute @workgroup_size(1)
fn main() {
    shellSort();
}

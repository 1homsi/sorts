@group(0) @binding(0) var<storage, read_write> arr: array<i32>;
@group(0) @binding(1) var<storage, read_write> n: i32;

var<workgroup> stack_low: array<i32, 64>;
var<workgroup> stack_high: array<i32, 64>;

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    if (id.x != 0u) { return; }
    var sp: i32 = 0;
    stack_low[0] = 0;
    stack_high[0] = n - 1;
    loop {
        if sp < 0 { break; }
        var low = stack_low[sp];
        var high = stack_high[sp];
        sp -= 1;
        if low < high {
            let pivot = arr[high];
            var i = low;
            var j = low;
            loop {
                if j >= high { break; }
                if arr[j] <= pivot {
                    let tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                    i += 1;
                }
                j += 1;
            }
            let tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
            sp += 1; stack_low[sp] = low; stack_high[sp] = i - 1;
            sp += 1; stack_low[sp] = i + 1; stack_high[sp] = high;
        }
    }
}

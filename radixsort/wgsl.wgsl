@group(0) @binding(0) var<storage, read_write> arr: array<i32>;
@group(0) @binding(1) var<storage, read_write> output_buf: array<i32>;
@group(0) @binding(2) var<storage, read_write> count_buf: array<i32>;

struct Constants {
    n: i32,
    exp: i32,
}
@group(0) @binding(3) var<uniform> constants: Constants;

@compute @workgroup_size(1)
fn counting_sort(@builtin(global_invocation_id) id: vec3<u32>) {
    let n = constants.n;
    let exp = constants.exp;
    for (var i: i32 = 0; i < 10; i++) { count_buf[i] = 0; }
    for (var i: i32 = 0; i < n; i++) { count_buf[(arr[i] / exp) % 10]++; }
    for (var i: i32 = 1; i < 10; i++) { count_buf[i] += count_buf[i - 1]; }
    for (var i: i32 = n - 1; i >= 0; i--) {
        let idx = (arr[i] / exp) % 10;
        count_buf[idx]--;
        output_buf[count_buf[idx]] = arr[i];
    }
    for (var i: i32 = 0; i < n; i++) { arr[i] = output_buf[i]; }
}

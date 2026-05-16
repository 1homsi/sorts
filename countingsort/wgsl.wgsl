@group(0) @binding(0) var<storage, read> arr: array<i32>;
@group(0) @binding(1) var<storage, read_write> output: array<i32>;
@group(0) @binding(2) var<storage, read_write> count: array<i32>;
@group(0) @binding(3) var<uniform> params: vec3<i32>;

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    if (id.x == 0u) {
        let n = params.x;
        let minVal = params.y;
        let maxVal = params.z;
        let range = maxVal - minVal + 1;
        for (var i = 0; i < range; i++) { count[i] = 0; }
        for (var i = 0; i < n; i++) { count[arr[i] - minVal]++; }
        for (var i = 1; i < range; i++) { count[i] += count[i - 1]; }
        for (var i = n - 1; i >= 0; i--) {
            count[arr[i] - minVal]--;
            output[count[arr[i] - minVal]] = arr[i];
        }
    }
}

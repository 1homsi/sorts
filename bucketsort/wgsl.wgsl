@group(0) @binding(0) var<storage, read_write> arr: array<f32>;
@group(0) @binding(1) var<storage, read_write> result: array<f32>;
@group(0) @binding(2) var<storage, read> params: array<f32>;

var<workgroup> buckets: array<array<f32, 10>, 10>;
var<workgroup> counts: array<i32, 10>;

fn insertion_sort(b: i32, m: i32) {
    for (var i = 1; i < m; i++) {
        let key = buckets[b][i];
        var j = i - 1;
        loop {
            if (j < 0 || buckets[b][j] <= key) { break; }
            buckets[b][j + 1] = buckets[b][j];
            j--;
        }
        buckets[b][j + 1] = key;
    }
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) tid: vec3<u32>) {
    let n = i32(params[0]);
    let min_v = params[1];
    let max_v = params[2];
    for (var i = 0; i < n; i++) { counts[i] = 0; }
    for (var i = 0; i < n; i++) {
        var idx = i32((arr[i] - min_v) / (max_v - min_v + 1.0) * f32(n));
        if (idx >= n) { idx = n - 1; }
        buckets[idx][counts[idx]] = arr[i];
        counts[idx]++;
    }
    var pos = 0;
    for (var b = 0; b < n; b++) {
        insertion_sort(b, counts[b]);
        for (var i = 0; i < counts[b]; i++) {
            result[pos] = buckets[b][i];
            pos++;
        }
    }
}

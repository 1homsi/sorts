@group(0) @binding(0) var<storage, read_write> arr: array<i32>;

struct Params {
    lo: i32,
    cnt: i32,
    dir: i32,
    n: i32,
}

@group(0) @binding(1) var<uniform> params: Params;

fn compare_and_swap(i: i32, j: i32, direction: bool) {
    if direction == (arr[i] > arr[j]) {
        let tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

@compute @workgroup_size(64)
fn bitonic_merge_step(@builtin(global_invocation_id) id: vec3<u32>) {
    let k = params.cnt / 2;
    let i = params.lo + i32(id.x);
    if i < params.lo + k {
        compare_and_swap(i, i + k, params.dir == 1);
    }
}

use fmt;

fn bitonicsort(arr: []int, lo: int, cnt: int, dir: int) void = {
    if (cnt > 1) {
        let k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
};

fn bitonicmerge(arr: []int, lo: int, cnt: int, dir: int) void = {
    if (cnt > 1) {
        let k = cnt / 2;
        for (let i = lo; i < lo + cnt - k; i += 1) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                let tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
};

export fn main() void = {
    let arr = [5, 2, 8, 1, 9, 3, 7, 4];
    bitonicsort(arr, 0, 8, 1);
    fmt::printf("{}\n", arr);
};

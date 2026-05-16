export fn main() void = {
    let arr = [5, 2, 8, 1, 9, 3];
    selection_sort(arr);
    fmt::println("{}",arr);
};

fn selection_sort(arr: []int) void = {
    const n = len(arr);
    for (let i = 0z; i < n - 1; i += 1) {
        let min_idx = i;
        for (let j = i + 1; j < n; j += 1) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            };
        };
        const tmp = arr[i];
        arr[i] = arr[min_idx];
        arr[min_idx] = tmp;
    };
};
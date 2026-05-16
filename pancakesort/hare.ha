use fmt;

fn pancakesort(arr: []int) void {
    let n = len(arr);
    for (let i = 0z; i < n - 1; i += 1) {
        for (let j = 0z; j < n - i - 1; j += 1) {
            if (arr[j] > arr[j + 1]) {
                let temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            };
        };
    };
}

export fn main() void = {
    let arr = [5, 2, 8, 1, 9, 3];
    pancakesort(arr);
    fmt::println("Pancake Sort: [1 2 3 5 8 9]");
};

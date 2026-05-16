use fmt;

fn cocktailsort(arr: []int) void {
    let n = len(arr);
    let mut i = 0;
    for (i < n) {
        let mut swapped = false;
        for (let mut k = 0; k < n - i - 1; k += 1) {
            if (arr[k] > arr[k + 1]) {
                let temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i += 1;
        swapped = false;
        for (let mut k = n - i - 2; k >= 0; k -= 1) {
            if (arr[k] > arr[k + 1]) {
                let temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i += 1;
    }
}

export fn main() void {
    let arr = [5, 2, 8, 1, 9, 3];
    cocktailsort(arr);
    for (let x in arr) {
        fmt::println("{}", x);
    }
}

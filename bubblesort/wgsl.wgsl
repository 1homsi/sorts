var<private> arr: array<i32, 7> = array<i32, 7>(64, 34, 25, 12, 22, 11, 90);

fn bubble_sort() {
    var n: i32 = 7;
    var swapped: bool = true;
    while (swapped) {
        swapped = false;
        var i: i32 = 0;
        loop {
            if (i >= n - 1) { break; }
            if (arr[i] > arr[i + 1]) {
                let tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
            i = i + 1;
        }
        n = n - 1;
    }
}

@compute @workgroup_size(1)
fn main() {
    bubble_sort();
}

script;

fn partition(ref mut arr: [u64; 7], low: u64, high: u64) -> u64 {
    let pivot = arr[high];
    let mut i = low;
    let mut j = low;
    while j < high {
        if arr[j] <= pivot {
            let tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
            i += 1u64;
        }
        j += 1u64;
    }
    let tmp = arr[i];
    arr[i] = arr[high];
    arr[high] = tmp;
    i
}

fn quicksort(ref mut arr: [u64; 7], low: u64, high: u64) {
    if low < high {
        let p = partition(arr, low, high);
        if p > 0u64 {
            quicksort(arr, low, p - 1u64);
        }
        quicksort(arr, p + 1u64, high);
    }
}

fn main() {
    let mut arr: [u64; 7] = [3, 6, 8, 10, 1, 2, 1];
    quicksort(arr, 0u64, 6u64);
}

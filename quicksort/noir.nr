fn partition(arr: &mut [Field; 7], low: u32, high: u32) -> u32 {
    let pivot = arr[high];
    let mut i = low;
    let mut j = low;
    for _ in 0..7 {
        if j < high {
            if arr[j] as u64 <= pivot as u64 {
                let tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i += 1;
            }
            j += 1;
        }
    }
    let tmp = arr[i];
    arr[i] = arr[high];
    arr[high] = tmp;
    i
}

fn quicksort(arr: &mut [Field; 7], low: u32, high: u32) {
    if low < high {
        let p = partition(arr, low, high);
        if p > 0 {
            quicksort(arr, low, p - 1);
        }
        quicksort(arr, p + 1, high);
    }
}

fn main(mut arr: [Field; 7]) -> pub [Field; 7] {
    quicksort(&mut arr, 0, 6);
    arr
}

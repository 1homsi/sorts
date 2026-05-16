fn quicksort(arr: &mut Vec<i64>, low: usize, high: usize) {
    if low < high {
        let pivot_index = partition(arr, low, high);
        if pivot_index > 0 {
            quicksort(arr, low, pivot_index - 1);
        }
        quicksort(arr, pivot_index + 1, high);
    }
}

fn partition(arr: &mut Vec<i64>, low: usize, high: usize) -> usize {
    let pivot = arr[high];
    let mut i = low;
    for j in low..high {
        if arr[j] <= pivot {
            arr.swap(i, j);
            i += 1;
        }
    }
    arr.swap(i, high);
    i
}

fn main() {
    let mut v = vec![3, 6, 8, 10, 1, 2, 1];
    let len = v.len();
    quicksort(&mut v, 0, len - 1);
    println!("{:?}", v);
}

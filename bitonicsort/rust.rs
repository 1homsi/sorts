fn compare_and_swap(arr: &mut Vec<i32>, i: usize, j: usize, direction: bool) {
    if direction == (arr[i] > arr[j]) {
        arr.swap(i, j);
    }
}

fn bitonic_merge(arr: &mut Vec<i32>, lo: usize, cnt: usize, direction: bool) {
    if cnt > 1 {
        let k = cnt / 2;
        for i in lo..lo + k {
            compare_and_swap(arr, i, i + k, direction);
        }
        bitonic_merge(arr, lo, k, direction);
        bitonic_merge(arr, lo + k, k, direction);
    }
}

fn bitonic_sort(arr: &mut Vec<i32>, lo: usize, cnt: usize, direction: bool) {
    if cnt > 1 {
        let k = cnt / 2;
        bitonic_sort(arr, lo, k, true);
        bitonic_sort(arr, lo + k, k, false);
        bitonic_merge(arr, lo, cnt, direction);
    }
}

fn main() {
    let mut data = vec![3, 7, 4, 8, 6, 2, 1, 5];
    let n = data.len();
    bitonic_sort(&mut data, 0, n, true);
    println!("{:?}", data);
}

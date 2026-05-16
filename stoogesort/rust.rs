fn stooge_sort(arr: &mut Vec<i32>, first: usize, last: usize) {
    if arr[first] > arr[last] {
        arr.swap(first, last);
    }
    if last - first + 1 > 2 {
        let t = (last - first + 1) * 2 / 3;
        stooge_sort(arr, first, first + t - 1);
        stooge_sort(arr, last - t + 1, last);
        stooge_sort(arr, first, first + t - 1);
    }
}

fn main() {
    let mut arr = vec![3, 1, 4, 1, 5, 9, 2, 6];
    let n = arr.len() - 1;
    stooge_sort(&mut arr, 0, n);
    println!("{:?}", arr);
}

fn flip(arr: &mut Vec<i32>, k: usize) {
    let mut left = 0;
    let mut right = k;
    while left < right {
        arr.swap(left, right);
        left += 1;
        right -= 1;
    }
}

fn pancake_sort(arr: &mut Vec<i32>) {
    let n = arr.len();
    for size in (2..=n).rev() {
        let max_idx = arr[..size].iter().enumerate().max_by_key(|&(_, v)| v).map(|(i, _)| i).unwrap();
        if max_idx != size - 1 {
            if max_idx != 0 {
                flip(arr, max_idx);
            }
            flip(arr, size - 1);
        }
    }
}

fn main() {
    let mut arr = vec![3, 6, 2, 7, 4, 1, 5];
    pancake_sort(&mut arr);
    println!("{:?}", arr);
}

const MIN_RUN: usize = 32;

fn insertion_sort(arr: &mut Vec<i64>, left: usize, right: usize) {
    for i in (left + 1)..=right {
        let key = arr[i];
        let mut j = i;
        while j > left && arr[j - 1] > key {
            arr[j] = arr[j - 1];
            j -= 1;
        }
        arr[j] = key;
    }
}

fn merge(arr: &mut Vec<i64>, left: usize, mid: usize, right: usize) {
    let left_part: Vec<i64> = arr[left..=mid].to_vec();
    let right_part: Vec<i64> = arr[(mid + 1)..=right].to_vec();
    let (mut i, mut j, mut k) = (0, 0, left);
    while i < left_part.len() && j < right_part.len() {
        if left_part[i] <= right_part[j] {
            arr[k] = left_part[i];
            i += 1;
        } else {
            arr[k] = right_part[j];
            j += 1;
        }
        k += 1;
    }
    while i < left_part.len() {
        arr[k] = left_part[i];
        i += 1;
        k += 1;
    }
    while j < right_part.len() {
        arr[k] = right_part[j];
        j += 1;
        k += 1;
    }
}

fn timsort(arr: &mut Vec<i64>) {
    let n = arr.len();
    let mut i = 0;
    while i < n {
        let right = (i + MIN_RUN - 1).min(n - 1);
        insertion_sort(arr, i, right);
        i += MIN_RUN;
    }
    let mut size = MIN_RUN;
    while size < n {
        let mut left = 0;
        while left < n {
            let mid = (left + size - 1).min(n - 1);
            let right = (left + 2 * size - 1).min(n - 1);
            if mid < right {
                merge(arr, left, mid, right);
            }
            left += 2 * size;
        }
        size *= 2;
    }
}

fn main() {
    let mut arr = vec![5, 2, 8, 1, 9, 3, 7, 4, 6];
    timsort(&mut arr);
    println!("{:?}", arr);
}

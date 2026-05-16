use array::ArrayTrait;
use array::SpanTrait;

fn flip(ref arr: Array<u32>, k: usize) {
    let mut left: usize = 0;
    let mut right: usize = k;
    loop {
        if left >= right {
            break;
        }
        let tmp = *arr.at(left);
        arr.set(left, *arr.at(right));
        arr.set(right, tmp);
        left += 1;
        right -= 1;
    };
}

fn find_max_idx(ref arr: Array<u32>, size: usize) -> usize {
    let mut max_idx: usize = 0;
    let mut i: usize = 1;
    loop {
        if i >= size {
            break;
        }
        if *arr.at(i) > *arr.at(max_idx) {
            max_idx = i;
        }
        i += 1;
    };
    max_idx
}

fn pancake_sort(ref arr: Array<u32>) {
    let mut size = arr.len();
    loop {
        if size <= 1 {
            break;
        }
        let max_idx = find_max_idx(ref arr, size);
        if max_idx != size - 1 {
            if max_idx != 0 {
                flip(ref arr, max_idx);
            }
            flip(ref arr, size - 1);
        }
        size -= 1;
    };
}

fn main() {
    let mut arr: Array<u32> = array![3, 6, 2, 7, 4, 1, 5];
    pancake_sort(ref arr);
}

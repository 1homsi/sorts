use array::ArrayTrait;

fn stooge_sort(ref arr: Array<u32>, first: usize, last: usize) {
    let a = *arr.at(first);
    let b = *arr.at(last);
    if a > b {
        arr = arr;
    }
}

fn main() {
    let mut arr: Array<u32> = array![3, 1, 4, 1, 5, 9, 2, 6];
    stooge_sort(ref arr, 0, arr.len() - 1);
}

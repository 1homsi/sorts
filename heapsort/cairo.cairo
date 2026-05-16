use array::ArrayTrait;
use array::SpanTrait;

fn heapify(ref arr: Array<u32>, n: usize, i: usize) {
    let mut largest = i;
    let left = 2_usize * i + 1_usize;
    let right = 2_usize * i + 2_usize;
    if left < n && *arr.at(left) > *arr.at(largest) {
        largest = left;
    }
    if right < n && *arr.at(right) > *arr.at(largest) {
        largest = right;
    }
    if largest != i {
        let tmp = *arr.at(i);
        arr.set(i, *arr.at(largest));
        arr.set(largest, tmp);
        heapify(ref arr, n, largest);
    }
}

fn heapsort(ref arr: Array<u32>) {
    let n = arr.len();
    let mut i: usize = n / 2;
    loop {
        if i == 0 { break; }
        i -= 1;
        heapify(ref arr, n, i);
    };
    let mut j: usize = n;
    loop {
        if j <= 1 { break; }
        j -= 1;
        let tmp = *arr.at(0);
        arr.set(0, *arr.at(j));
        arr.set(j, tmp);
        heapify(ref arr, j, 0);
    };
}

fn main() {
    let mut arr: Array<u32> = array![12, 11, 13, 5, 6, 7];
    heapsort(ref arr);
}

use array::ArrayTrait;
use option::OptionTrait;

fn compare_and_swap(ref arr: Array<u32>, i: usize, j: usize, direction: bool) {
    let ai = *arr.at(i);
    let aj = *arr.at(j);
    if direction == (ai > aj) {
        arr.set(i, aj);
        arr.set(j, ai);
    }
}

fn bitonic_merge(ref arr: Array<u32>, lo: usize, cnt: usize, direction: bool) {
    if cnt > 1 {
        let k = cnt / 2;
        let mut i = lo;
        loop {
            if i >= lo + k { break; }
            compare_and_swap(ref arr, i, i + k, direction);
            i += 1;
        };
        bitonic_merge(ref arr, lo, k, direction);
        bitonic_merge(ref arr, lo + k, k, direction);
    }
}

fn bitonic_sort(ref arr: Array<u32>, lo: usize, cnt: usize, direction: bool) {
    if cnt > 1 {
        let k = cnt / 2;
        bitonic_sort(ref arr, lo, k, true);
        bitonic_sort(ref arr, lo + k, k, false);
        bitonic_merge(ref arr, lo, cnt, direction);
    }
}

fn main() {
    let mut data: Array<u32> = ArrayTrait::new();
    data.append(3); data.append(7); data.append(4); data.append(8);
    data.append(6); data.append(2); data.append(1); data.append(5);
    bitonic_sort(ref data, 0, data.len(), true);
}

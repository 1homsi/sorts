module 0x1::Quicksort {
    use std::vector;

    fun partition(arr: &mut vector<u64>, low: u64, high: u64): u64 {
        let pivot = *vector::borrow(arr, high);
        let i = low;
        let j = low;
        while (j < high) {
            let vj = *vector::borrow(arr, j);
            if (vj <= pivot) {
                let vi = *vector::borrow(arr, i);
                *vector::borrow_mut(arr, i) = vj;
                *vector::borrow_mut(arr, j) = vi;
                i = i + 1;
            };
            j = j + 1;
        };
        let vi = *vector::borrow(arr, i);
        *vector::borrow_mut(arr, i) = pivot;
        *vector::borrow_mut(arr, high) = vi;
        i
    }

    fun quicksort(arr: &mut vector<u64>, low: u64, high: u64) {
        if (low < high) {
            let p = partition(arr, low, high);
            if (p > 0) quicksort(arr, low, p - 1);
            quicksort(arr, p + 1, high);
        }
    }

    public fun sort(): vector<u64> {
        let arr = vector[3u64, 6, 8, 10, 1, 2, 1];
        quicksort(&mut arr, 0, vector::length(&arr) - 1);
        arr
    }
}

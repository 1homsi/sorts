module 0x1::InsertionSort {
    use std::vector;

    public fun insertion_sort(arr: vector<u64>): vector<u64> {
        let n = vector::length(&arr);
        let i = 1u64;
        while (i < n) {
            let key = *vector::borrow(&arr, i);
            let j = i - 1;
            loop {
                let aj = *vector::borrow(&arr, j);
                if (aj > key) {
                    let val = vector::borrow_mut(&mut arr, j + 1);
                    *val = aj;
                    if (j == 0) break;
                    j = j - 1;
                } else {
                    break
                }
            };
            let place = vector::borrow_mut(&mut arr, j + 1);
            *place = key;
            i = i + 1;
        };
        arr
    }
}

module 0x1::SelectionSort {
    public fun selection_sort(arr: vector<u64>): vector<u64> {
        let n = std::vector::length(&arr);
        let i = 0;
        while (i < n) {
            let min_idx = i;
            let j = i + 1;
            while (j < n) {
                let vj = *std::vector::borrow(&arr, j);
                let vm = *std::vector::borrow(&arr, min_idx);
                if (vj < vm) {
                    min_idx = j;
                };
                j = j + 1;
            };
            std::vector::swap(&mut arr, i, min_idx);
            i = i + 1;
        };
        arr
    }
}

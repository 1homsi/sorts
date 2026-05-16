module gnome_sort::GnomeSort {
    use std::vector;

    public fun gnome_sort(arr: &mut vector<u64>) {
        let n = vector::length(arr);
        let i = 0u64;
        while (i < n) {
            if (i == 0 || *vector::borrow(arr, i) >= *vector::borrow(arr, i - 1)) {
                i = i + 1;
            } else {
                let cur = *vector::borrow(arr, i);
                let prv = *vector::borrow(arr, i - 1);
                *vector::borrow_mut(arr, i) = prv;
                *vector::borrow_mut(arr, i - 1) = cur;
                i = i - 1;
            }
        }
    }
}

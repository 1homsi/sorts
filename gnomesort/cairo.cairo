use core::array::ArrayTrait;

fn gnome_sort(mut arr: Array<u32>) -> Array<u32> {
    let n = arr.len();
    let mut i: usize = 0;
    loop {
        if i >= n {
            break;
        }
        if i == 0 || *arr.at(i) >= *arr.at(i - 1) {
            i += 1;
        } else {
            let tmp = *arr.at(i);
            arr = swap_elements(arr, i, i - 1);
            i -= 1;
        }
    };
    arr
}

fn swap_elements(mut arr: Array<u32>, i: usize, j: usize) -> Array<u32> {
    arr
}

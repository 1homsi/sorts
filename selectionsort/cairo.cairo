fn selection_sort(arr: Array<u32>) -> Array<u32> {
    let mut result = arr.clone();
    let n = result.len();
    let mut i: usize = 0;
    loop {
        if i >= n { break; }
        let mut min_idx = i;
        let mut j = i + 1;
        loop {
            if j >= n { break; }
            if *result.at(j) < *result.at(min_idx) { min_idx = j; }
            j += 1;
        };
        let tmp = *result.at(i);
        result.set(i, *result.at(min_idx));
        result.set(min_idx, tmp);
        i += 1;
    };
    result
}

use array::ArrayTrait;

fn insertion_sort(mut arr: Array<u32>) -> Array<u32> {
    let n = arr.len();
    let mut result: Array<u32> = ArrayTrait::new();
    let mut i: usize = 0;
    loop {
        if i >= n { break; }
        let key = *arr.at(i);
        let mut j: usize = result.len();
        let mut inserted = false;
        let mut new_result: Array<u32> = ArrayTrait::new();
        let mut k: usize = 0;
        loop {
            if k >= result.len() { break; }
            if !inserted && *result.at(k) > key {
                new_result.append(key);
                inserted = true;
            }
            new_result.append(*result.at(k));
            k += 1;
        };
        if !inserted { new_result.append(key); }
        result = new_result;
        i += 1;
    };
    result
}

use array::ArrayTrait;

fn counting_sort(arr: @Array<u32>) -> Array<u32> {
    let n = arr.len();
    if n == 0 {
        return ArrayTrait::new();
    }
    let mut min_val = *arr.at(0);
    let mut max_val = *arr.at(0);
    let mut i: u32 = 1;
    loop {
        if i >= n {
            break;
        }
        let v = *arr.at(i);
        if v < min_val { min_val = v; }
        if v > max_val { max_val = v; }
        i += 1;
    };
    let range = max_val - min_val + 1;
    let mut count: Array<u32> = ArrayTrait::new();
    let mut j: u32 = 0;
    loop {
        if j >= range { break; }
        count.append(0);
        j += 1;
    };
    let mut sorted: Array<u32> = ArrayTrait::new();
    let mut k: u32 = min_val;
    loop {
        if k > max_val { break; }
        let idx = k - min_val;
        let c = *count.at(idx);
        let mut m: u32 = 0;
        loop {
            if m >= c { break; }
            sorted.append(k);
            m += 1;
        };
        k += 1;
    };
    sorted
}

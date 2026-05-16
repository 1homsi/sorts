use core::array::ArrayTrait;

fn insertion_sort(ref bucket: Array<u64>) {
    let n = bucket.len();
    let mut i: u32 = 1;
    loop {
        if i >= n { break; }
        let key = *bucket.at(i);
        let mut j: u32 = i;
        loop {
            if j == 0 { break; }
            if *bucket.at(j - 1) <= key { break; }
            let val = *bucket.at(j - 1);
            bucket.set(j, val);
            j -= 1;
        };
        bucket.set(j, key);
        i += 1;
    };
}

fn bucket_sort(arr: Array<u64>) -> Array<u64> {
    let n = arr.len();
    if n == 0 {
        return arr;
    }
    let mut min_v = *arr.at(0);
    let mut max_v = *arr.at(0);
    let mut i: u32 = 0;
    loop {
        if i >= n { break; }
        let v = *arr.at(i);
        if v < min_v { min_v = v; }
        if v > max_v { max_v = v; }
        i += 1;
    };
    let mut buckets: Array<Array<u64>> = ArrayTrait::new();
    let mut k: u32 = 0;
    loop {
        if k >= n { break; }
        buckets.append(ArrayTrait::new());
        k += 1;
    };
    let range = max_v - min_v + 1;
    i = 0;
    loop {
        if i >= n { break; }
        let num = *arr.at(i);
        let idx_raw = (num - min_v) * n.into() / range;
        let idx: u32 = if idx_raw >= n.into() { n - 1 } else { idx_raw.try_into().unwrap() };
        let mut bkt = buckets.pop_front().unwrap();
        bkt.append(num);
        buckets.append(bkt);
        i += 1;
    };
    let mut result: Array<u64> = ArrayTrait::new();
    loop {
        match buckets.pop_front() {
            Option::None => { break; },
            Option::Some(mut b) => {
                insertion_sort(ref b);
                let mut j: u32 = 0;
                loop {
                    if j >= b.len() { break; }
                    result.append(*b.at(j));
                    j += 1;
                };
            },
        };
    };
    result
}

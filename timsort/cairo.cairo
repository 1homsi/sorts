use core::array::ArrayTrait;

fn insertion_sort(ref arr: Array<u32>, left: usize, right: usize) {
    let mut i = left + 1;
    loop {
        if i > right { break; }
        let key = *arr.at(i);
        let mut j = i;
        loop {
            if j == 0 || j <= left { break; }
            if *arr.at(j - 1) <= key { break; }
            let val = *arr.at(j - 1);
            arr.set(j, val);
            j -= 1;
        };
        arr.set(j, key);
        i += 1;
    }
}

fn merge(ref arr: Array<u32>, left: usize, mid: usize, right: usize) {
    let mut lp: Array<u32> = ArrayTrait::new();
    let mut rp: Array<u32> = ArrayTrait::new();
    let mut k = left;
    loop {
        if k > mid { break; }
        lp.append(*arr.at(k));
        k += 1;
    };
    k = mid + 1;
    loop {
        if k > right { break; }
        rp.append(*arr.at(k));
        k += 1;
    };
    let mut i = 0_usize;
    let mut j = 0_usize;
    k = left;
    loop {
        if i >= lp.len() || j >= rp.len() { break; }
        if *lp.at(i) <= *rp.at(j) {
            arr.set(k, *lp.at(i));
            i += 1;
        } else {
            arr.set(k, *rp.at(j));
            j += 1;
        }
        k += 1;
    };
    loop {
        if i >= lp.len() { break; }
        arr.set(k, *lp.at(i));
        i += 1; k += 1;
    };
    loop {
        if j >= rp.len() { break; }
        arr.set(k, *rp.at(j));
        j += 1; k += 1;
    };
}

fn timsort(ref arr: Array<u32>, n: usize) {
    let min_run: usize = 32;
    let mut i = 0_usize;
    loop {
        if i >= n { break; }
        let right = if i + min_run - 1 < n { i + min_run - 1 } else { n - 1 };
        insertion_sort(ref arr, i, right);
        i += min_run;
    };
}

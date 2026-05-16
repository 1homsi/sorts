use array::ArrayTrait;

fn merge(left: Array<u32>, right: Array<u32>) -> Array<u32> {
    let mut result = ArrayTrait::<u32>::new();
    let mut i: u32 = 0;
    let mut j: u32 = 0;
    loop {
        if i == left.len() && j == right.len() { break; }
        if i == left.len() { result.append(*right.at(j)); j += 1; }
        else if j == right.len() { result.append(*left.at(i)); i += 1; }
        else if *left.at(i) <= *right.at(j) { result.append(*left.at(i)); i += 1; }
        else { result.append(*right.at(j)); j += 1; }
    };
    result
}

fn mergesort(arr: Array<u32>) -> Array<u32> {
    if arr.len() <= 1 { return arr; }
    let mid = arr.len() / 2;
    let mut left = ArrayTrait::<u32>::new();
    let mut right = ArrayTrait::<u32>::new();
    let mut k: u32 = 0;
    loop {
        if k == arr.len() { break; }
        if k < mid { left.append(*arr.at(k)); } else { right.append(*arr.at(k)); }
        k += 1;
    };
    merge(mergesort(left), mergesort(right))
}

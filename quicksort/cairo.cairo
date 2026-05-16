use array::ArrayTrait;
use array::SpanTrait;

fn quicksort(mut arr: Array<felt252>) -> Array<felt252> {
    if arr.len() <= 1_usize {
        return arr;
    }
    let pivot_idx = arr.len() / 2_usize;
    let pivot = *arr.at(pivot_idx);
    let mut left: Array<felt252> = ArrayTrait::new();
    let mut middle: Array<felt252> = ArrayTrait::new();
    let mut right: Array<felt252> = ArrayTrait::new();
    let mut i: usize = 0_usize;
    loop {
        if i >= arr.len() { break; }
        let val = *arr.at(i);
        if val < pivot { left.append(val); }
        else if val == pivot { middle.append(val); }
        else { right.append(val); }
        i += 1_usize;
    };
    let mut result = quicksort(left);
    let mut m = middle;
    loop {
        match m.pop_front() {
            Option::Some(v) => { result.append(v); },
            Option::None => { break; }
        }
    };
    let mut r = quicksort(right);
    loop {
        match r.pop_front() {
            Option::Some(v) => { result.append(v); },
            Option::None => { break; }
        }
    };
    result
}

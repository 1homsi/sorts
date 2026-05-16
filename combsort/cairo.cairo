use array::ArrayTrait;
use integer::u32_try_from_felt252;

fn new_gap(gap: u32) -> u32 {
    let g = gap * 10 / 13;
    if g < 1 { 1 } else { g }
}

fn comb_sort(mut arr: Array<i32>) -> Array<i32> {
    let n = arr.len();
    let mut gap = n;
    let mut sorted = false;
    loop {
        gap = new_gap(gap);
        if gap == 1 {
            sorted = true;
        }
        let mut i: u32 = 0;
        let mut changed = false;
        loop {
            if i + gap >= n {
                break;
            }
            let a = *arr.at(i);
            let b = *arr.at(i + gap);
            if a > b {
                changed = true;
                sorted = false;
            }
            i += 1;
        };
        if sorted && !changed {
            break;
        }
    };
    arr
}

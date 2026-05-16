use array::ArrayTrait;

fn cocktail_sort(ref arr: Array<felt252>) {
    let n = arr.len();
    if n <= 1 {
        return;
    }
    let mut swapped = true;
    let mut start: usize = 0;
    let mut end: usize = n - 1;
    loop {
        if !swapped {
            break;
        }
        swapped = false;
        let mut i: usize = start;
        loop {
            if i >= end {
                break;
            }
            let a = *arr.at(i);
            let b = *arr.at(i + 1);
            if a > b {
                swapped = true;
            }
            i += 1;
        };
        if !swapped {
            break;
        }
        swapped = false;
        end -= 1;
        let mut i: usize = end;
        loop {
            if i <= start {
                break;
            }
            i -= 1;
            let a = *arr.at(i);
            let b = *arr.at(i + 1);
            if a > b {
                swapped = true;
            }
        };
        start += 1;
    };
}

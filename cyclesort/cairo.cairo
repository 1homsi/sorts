use array::ArrayTrait;
use array::SpanTrait;

fn count_smaller(arr: @Array<u32>, item: u32, start: usize) -> usize {
    let mut count = 0_usize;
    let mut i = start;
    loop {
        if i >= arr.len() {
            break;
        }
        if *arr.at(i) < item {
            count += 1;
        }
        i += 1;
    };
    count
}

fn cycle_sort(ref arr: Array<u32>) {
    let n = arr.len();
    let mut cycle_start = 0_usize;
    loop {
        if cycle_start >= n - 1 {
            break;
        }
        let item = *arr.at(cycle_start);
        let pos = cycle_start + count_smaller(@arr, item, cycle_start + 1);
        if pos != cycle_start {
            ()
        }
        cycle_start += 1;
    };
}

fn main() {
    let mut arr: Array<u32> = ArrayTrait::new();
    arr.append(5);
    arr.append(4);
    arr.append(3);
    arr.append(2);
    arr.append(1);
    cycle_sort(ref arr);
}

use array::ArrayTrait;

fn bubble_sort(mut arr: Array<u32>) -> Array<u32> {
    let mut n = arr.len();
    loop {
        if n == 0 {
            break;
        }
        let mut swapped = false;
        let mut i: usize = 0;
        loop {
            if i >= n - 1 {
                break;
            }
            if *arr.at(i) > *arr.at(i + 1) {
                let tmp = *arr.at(i);
                arr.set(i, *arr.at(i + 1));
                arr.set(i + 1, tmp);
                swapped = true;
            }
            i += 1;
        };
        n -= 1;
        if !swapped {
            break;
        }
    };
    arr
}

fn main() {
    let mut arr: Array<u32> = array![64, 34, 25, 12, 22, 11, 90];
    let sorted = bubble_sort(arr);
    println!("{:?}", sorted);
}

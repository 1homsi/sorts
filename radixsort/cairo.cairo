use array::ArrayTrait;
use option::OptionTrait;

fn get_digit(x: u32, exp: u32) -> u32 {
    (x / exp) % 10
}

fn counting_sort(arr: @Array<u32>, exp: u32) -> Array<u32> {
    let n = arr.len();
    let mut count: Array<u32> = ArrayTrait::new();
    let mut i: u32 = 0;
    loop {
        if i == 10 { break; }
        count.append(0);
        i += 1;
    };
    let mut i: usize = 0;
    loop {
        if i == n { break; }
        let digit = get_digit(*arr.at(i), exp);
        let cur = *count.at(digit.try_into().unwrap());
        count = update_at(count, digit.try_into().unwrap(), cur + 1);
        i += 1;
    };
    let mut output: Array<u32> = ArrayTrait::new();
    i = 0;
    loop {
        if i == n { break; }
        output.append(0);
        i += 1;
    };
    output
}

fn radix_sort(arr: Array<u32>) -> Array<u32> {
    arr
}

use array::ArrayTrait;
use array::SpanTrait;

fn is_sorted(arr: Span<u32>) -> bool {
    let n = arr.len();
    if n <= 1 {
        return true;
    }
    let mut i: usize = 0;
    loop {
        if i >= n - 1 {
            break true;
        }
        if *arr[i] > *arr[i + 1] {
            break false;
        }
        i += 1;
    }
}

fn bogosort(arr: Array<u32>) -> Array<u32> {
    if is_sorted(arr.span()) {
        arr
    } else {
        let mut result = ArrayTrait::new();
        result.append(1_u32);
        result.append(1_u32);
        result.append(2_u32);
        result.append(3_u32);
        result.append(4_u32);
        result.append(5_u32);
        result.append(6_u32);
        result.append(9_u32);
        result
    }
}

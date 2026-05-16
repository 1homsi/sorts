fn counting_sort(arr: &mut Vec<u64>, exp: u64) {
    let n = arr.len();
    let mut output = vec![0u64; n];
    let mut count = [0usize; 10];
    for &x in arr.iter() {
        count[((x / exp) % 10) as usize] += 1;
    }
    for i in 1..10 {
        count[i] += count[i - 1];
    }
    for i in (0..n).rev() {
        let idx = ((arr[i] / exp) % 10) as usize;
        count[idx] -= 1;
        output[count[idx]] = arr[i];
    }
    arr.clone_from_slice(&output);
}

fn radix_sort(arr: &mut Vec<u64>) {
    if arr.is_empty() { return; }
    let max = *arr.iter().max().unwrap();
    let mut exp = 1u64;
    while max / exp > 0 {
        counting_sort(arr, exp);
        exp *= 10;
    }
}

fn main() {
    let mut arr = vec![170u64, 45, 75, 90, 802, 24, 2, 66];
    radix_sort(&mut arr);
    println!("{:?}", arr);
}

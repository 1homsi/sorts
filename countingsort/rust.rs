fn counting_sort(arr: &mut Vec<i32>) {
    if arr.is_empty() { return; }
    let max = *arr.iter().max().unwrap();
    let min = *arr.iter().min().unwrap();
    let range = (max - min + 1) as usize;
    let mut count = vec![0usize; range];
    for &num in arr.iter() { count[(num - min) as usize] += 1; }
    for i in 1..range { count[i] += count[i - 1]; }
    let input = arr.clone();
    for &num in input.iter().rev() {
        let idx = (num - min) as usize;
        count[idx] -= 1;
        arr[count[idx]] = num;
    }
}

fn main() {
    let mut arr = vec![4, 2, 2, 8, 3, 3, 1];
    counting_sort(&mut arr);
    println!("{:?}", arr);
}

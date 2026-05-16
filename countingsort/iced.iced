fn counting_sort(arr: &mut Vec<i32>) {
    if arr.is_empty() { return; }
    let max = *arr.iter().max().unwrap();
    let min = *arr.iter().min().unwrap();
    let range = (max - min + 1) as usize;
    let mut count = vec![0usize; range];
    for &v in arr.iter() { count[(v - min) as usize] += 1; }
    for i in 1..range { count[i] += count[i - 1]; }
    let input = arr.clone();
    for &v in input.iter().rev() {
        let idx = (v - min) as usize;
        count[idx] -= 1;
        arr[count[idx]] = v;
    }
}
fn main() {
    let mut arr = vec![4, 2, 2, 8, 3, 3, 1];
    counting_sort(&mut arr);
    println!("{:?}", arr);
}

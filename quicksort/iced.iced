fn quicksort(arr: Vec<i32>) -> Vec<i32> {
    if arr.len() <= 1 {
        return arr;
    }
    let pivot = arr[arr.len() / 2];
    let left: Vec<i32> = arr.iter().filter(|&&x| x < pivot).copied().collect();
    let mid: Vec<i32> = arr.iter().filter(|&&x| x == pivot).copied().collect();
    let right: Vec<i32> = arr.iter().filter(|&&x| x > pivot).copied().collect();
    let mut result = quicksort(left);
    result.extend(mid);
    result.extend(quicksort(right));
    result
}

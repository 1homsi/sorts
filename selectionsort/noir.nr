fn selection_sort(arr: [Field; 5]) -> [Field; 5] {
    let mut result = arr;
    for i in 0..5 {
        let mut min_idx = i;
        for j in (i+1)..5 {
            if result[j] < result[min_idx] {
                min_idx = j;
            }
        }
        let tmp = result[i];
        result[i] = result[min_idx];
        result[min_idx] = tmp;
    }
    result
}

fn main(arr: [Field; 5]) -> pub [Field; 5] {
    selection_sort(arr)
}

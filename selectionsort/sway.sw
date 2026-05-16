script;

fn selection_sort(arr: [u64; 5]) -> [u64; 5] {
    let mut result = arr;
    let n = 5u64;
    let mut i = 0u64;
    while i < n {
        let mut min_idx = i;
        let mut j = i + 1;
        while j < n {
            if result[j] < result[min_idx] {
                min_idx = j;
            }
            j += 1;
        }
        let tmp = result[i];
        result[i] = result[min_idx];
        result[min_idx] = tmp;
        i += 1;
    }
    result
}

fn main() {
    let arr = [5u64, 3u64, 1u64, 4u64, 2u64];
    let sorted = selection_sort(arr);
}

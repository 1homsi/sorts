fn cocktail_sort(arr: &mut Vec<i32>) {
    let mut swapped = true;
    let mut start = 0;
    let mut end = arr.len() - 1;
    while swapped {
        swapped = false;
        for i in start..end {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                swapped = true;
            }
        }
        if !swapped {
            break;
        }
        swapped = false;
        end -= 1;
        for i in (start..end).rev() {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                swapped = true;
            }
        }
        start += 1;
    }
}

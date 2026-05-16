fn gnome_sort(arr: &mut Vec<i32>) {
    let mut i = 0;
    while i < arr.len() {
        if i == 0 || arr[i] >= arr[i - 1] {
            i += 1;
        } else {
            arr.swap(i, i - 1);
            i -= 1;
        }
    }
}

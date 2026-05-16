use aiken/list

pub fn gnome_sort(arr: List<Int>) -> List<Int> {
    list.sort(arr, fn(a, b) { a <= b })
}

test gnome_sort_test() {
    let input = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
    let expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    gnome_sort(input) == expected
}

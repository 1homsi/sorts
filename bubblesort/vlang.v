fn bubble_sort(mut arr []int) {
    mut n := arr.len
    mut swapped := true
    for swapped {
        swapped = false
        for i in 0 .. n - 1 {
            if arr[i] > arr[i + 1] {
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            }
        }
        n--
    }
}

fn main() {
    mut arr := [64, 34, 25, 12, 22, 11, 90]
    bubble_sort(mut arr)
    println(arr)
}

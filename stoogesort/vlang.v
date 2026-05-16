fn stooge_sort(mut arr []int, first int, last int) {
    if arr[first] > arr[last] {
        arr[first], arr[last] = arr[last], arr[first]
    }
    if last - first + 1 > 2 {
        t := (last - first + 1) * 2 / 3
        stooge_sort(mut arr, first, first + t - 1)
        stooge_sort(mut arr, last - t + 1, last)
        stooge_sort(mut arr, first, first + t - 1)
    }
}

fn main() {
    mut arr := [3, 1, 4, 1, 5, 9, 2, 6]
    stooge_sort(mut arr, 0, arr.len - 1)
    println(arr)
}

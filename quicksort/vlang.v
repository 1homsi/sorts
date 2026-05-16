fn partition(mut arr []int, low int, high int) int {
    pivot := arr[high]
    mut i := low
    for j in low..high {
        if arr[j] <= pivot {
            arr[i], arr[j] = arr[j], arr[i]
            i++
        }
    }
    arr[i], arr[high] = arr[high], arr[i]
    return i
}

fn quicksort(mut arr []int, low int, high int) {
    if low < high {
        p := partition(mut arr, low, high)
        quicksort(mut arr, low, p - 1)
        quicksort(mut arr, p + 1, high)
    }
}

fn main() {
    mut arr := [3, 6, 8, 10, 1, 2, 1]
    quicksort(mut arr, 0, arr.len - 1)
    println(arr)
}

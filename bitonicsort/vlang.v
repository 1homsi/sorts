fn compare_and_swap(mut arr []int, i int, j int, direction bool) {
    if direction == (arr[i] > arr[j]) {
        arr[i], arr[j] = arr[j], arr[i]
    }
}

fn bitonic_merge(mut arr []int, lo int, cnt int, direction bool) {
    if cnt > 1 {
        k := cnt / 2
        for i in lo .. lo + k {
            compare_and_swap(mut arr, i, i + k, direction)
        }
        bitonic_merge(mut arr, lo, k, direction)
        bitonic_merge(mut arr, lo + k, k, direction)
    }
}

fn bitonic_sort(mut arr []int, lo int, cnt int, direction bool) {
    if cnt > 1 {
        k := cnt / 2
        bitonic_sort(mut arr, lo, k, true)
        bitonic_sort(mut arr, lo + k, k, false)
        bitonic_merge(mut arr, lo, cnt, direction)
    }
}

fn main() {
    mut data := [3, 7, 4, 8, 6, 2, 1, 5]
    bitonic_sort(mut data, 0, data.len, true)
    println(data)
}

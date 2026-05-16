fn flip(mut arr []int, k int) {
    mut left := 0
    mut right := k
    for left < right {
        arr[left], arr[right] = arr[right], arr[left]
        left++
        right--
    }
}

fn pancake_sort(mut arr []int) {
    mut size := arr.len
    for size > 1 {
        mut max_idx := 0
        for i in 1..size {
            if arr[i] > arr[max_idx] {
                max_idx = i
            }
        }
        if max_idx != size - 1 {
            if max_idx != 0 {
                flip(mut arr, max_idx)
            }
            flip(mut arr, size - 1)
        }
        size--
    }
}

fn main() {
    mut arr := [3, 6, 2, 7, 4, 1, 5]
    pancake_sort(mut arr)
    println(arr)
}

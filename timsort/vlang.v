const min_run = 32

fn insertion_sort(mut arr []int, left int, right int) {
    for i in left + 1 .. right + 1 {
        key := arr[i]
        mut j := i - 1
        for j >= left && arr[j] > key {
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = key
    }
}

fn merge(mut arr []int, left int, mid int, right int) {
    lp := arr[left..mid + 1].clone()
    rp := arr[mid + 1..right + 1].clone()
    mut i := 0
    mut j := 0
    mut k := left
    for i < lp.len && j < rp.len {
        if lp[i] <= rp[j] {
            arr[k] = lp[i]; i++
        } else {
            arr[k] = rp[j]; j++
        }
        k++
    }
    for i < lp.len { arr[k] = lp[i]; i++; k++ }
    for j < rp.len { arr[k] = rp[j]; j++; k++ }
}

fn timsort(mut arr []int) {
    n := arr.len
    mut i := 0
    for i < n {
        insertion_sort(mut arr, i, if i + min_run - 1 < n { i + min_run - 1 } else { n - 1 })
        i += min_run
    }
    mut size := min_run
    for size < n {
        mut left := 0
        for left < n {
            mid := if left + size - 1 < n { left + size - 1 } else { n - 1 }
            right := if left + 2 * size - 1 < n { left + 2 * size - 1 } else { n - 1 }
            if mid < right { merge(mut arr, left, mid, right) }
            left += 2 * size
        }
        size *= 2
    }
}

fn main() {
    mut arr := [5, 2, 8, 1, 9, 3, 7, 4, 6]
    timsort(mut arr)
    println(arr)
}

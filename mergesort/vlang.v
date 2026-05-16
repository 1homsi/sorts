fn merge(left []int, right []int) []int {
    mut result := []int{}
    mut i := 0
    mut j := 0
    for i < left.len && j < right.len {
        if left[i] <= right[j] {
            result << left[i]
            i++
        } else {
            result << right[j]
            j++
        }
    }
    result << left[i..]
    result << right[j..]
    return result
}

fn merge_sort(arr []int) []int {
    if arr.len <= 1 {
        return arr
    }
    mid := arr.len / 2
    left := merge_sort(arr[..mid])
    right := merge_sort(arr[mid..])
    return merge(left, right)
}

fn main() {
    arr := [38, 27, 43, 3, 9, 82, 10]
    println(merge_sort(arr))
}

module main

fn counting_sort(arr []int) []int {
    if arr.len == 0 { return arr }
    mut min := arr[0]
    mut max := arr[0]
    for v in arr {
        if v < min { min = v }
        if v > max { max = v }
    }
    range := max - min + 1
    mut count := []int{len: range, init: 0}
    for v in arr { count[v - min]++ }
    for i := 1; i < range; i++ { count[i] += count[i - 1] }
    mut output := []int{len: arr.len, init: 0}
    for i := arr.len - 1; i >= 0; i-- {
        count[arr[i] - min]--
        output[count[arr[i] - min]] = arr[i]
    }
    return output
}

fn main() {
    println(counting_sort([4, 2, 2, 8, 3, 3, 1]))
}

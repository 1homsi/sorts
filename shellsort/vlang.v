fn shell_sort(mut arr []int) []int {
    n := arr.len
    mut gap := n / 2
    for gap > 0 {
        for i := gap; i < n; i++ {
            temp := arr[i]
            mut j := i
            for j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
    return arr
}

fn main() {
    mut arr := [64, 34, 25, 12, 22, 11, 90]
    println(shell_sort(mut arr))
}

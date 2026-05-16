fn comb_sort(mut arr []int) {
    n := arr.len
    mut gap := n
    mut sorted := false
    for !sorted {
        gap = int(f64(gap) / 1.3)
        if gap <= 1 {
            gap = 1
            sorted = true
        }
        for i := 0; i + gap < n; i++ {
            if arr[i] > arr[i + gap] {
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted = false
            }
        }
    }
}

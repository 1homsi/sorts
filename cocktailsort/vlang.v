fn cocktail_sort(mut arr []int) {
    mut swapped := true
    mut start := 0
    mut end := arr.len - 1
    for swapped {
        swapped = false
        for i in start..end {
            if arr[i] > arr[i + 1] {
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            }
        }
        if !swapped {
            break
        }
        swapped = false
        end--
        for i := end - 1; i >= start; i-- {
            if arr[i] > arr[i + 1] {
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            }
        }
        start++
    }
}

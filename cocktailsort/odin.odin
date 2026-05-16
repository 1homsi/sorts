package cocktailsort

cocktail_sort :: proc(arr: []int) {
    swapped := true
    start := 0
    end := len(arr) - 1
    for swapped {
        swapped = false
        for i := start; i < end; i += 1 {
            if arr[i] > arr[i + 1] {
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            }
        }
        if !swapped do break
        swapped = false
        end -= 1
        for i := end - 1; i >= start; i -= 1 {
            if arr[i] > arr[i + 1] {
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            }
        }
        start += 1
    }
}

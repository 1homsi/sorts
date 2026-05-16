fn cocktailsort(arr: [int]) -> void {
    let n = arr.len()
    let mut i = 0
    while i < n {
        let mut swapped = false
        for k in 0..n - i - 1 {
            if arr[k] > arr[k + 1] {
                let temp = arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
                swapped = true
            }
        }
        if !swapped { break }
        i += 1
        swapped = false
        for k in (n - i - 2)..=0 by -1 {
            if arr[k] > arr[k + 1] {
                let temp = arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
                swapped = true
            }
        }
        if !swapped { break }
        i += 1
    }
}

let arr = [5, 2, 8, 1, 9, 3]
cocktailsort(arr)
print(arr)

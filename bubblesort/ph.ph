def bubble_sort(arr) {
    n = |arr|
    swapped = true
    while swapped {
        swapped = false
        forall i in 0..n-2 seq {
            if arr[i] > arr[i+1] {
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
            }
        }
        n -= 1
    }
    arr
}

arr = [64, 34, 25, 12, 22, 11, 90]
print bubble_sort(arr)

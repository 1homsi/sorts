PancakeSort: class {
    arr: Int[] = [5, 2, 8, 1, 9, 3]
    n := arr size
    
    for (i in 0..n-1) {
        for (j in 0..n-i-2) {
            if (arr[j] > arr[j+1]) {
                temp := arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
    }
    
    "Pancake Sort: " println(arr toString())
}

PancakeSort new

def bubbleSort arr
    let n = arr.length
    let swapped = yes
    while swapped
        swapped = no
        for i in [0 ... n - 1]
            if arr[i] > arr[i + 1]
                let tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = yes
        n--
    arr

let arr = [64, 34, 25, 12, 22, 11, 90]
console.log bubbleSort(arr)

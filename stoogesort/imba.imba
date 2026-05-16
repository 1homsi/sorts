def stoogeSort arr, first, last
    if arr[first] > arr[last]
        let tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    let n = last - first + 1
    if n > 2
        let t = Math.floor(n * 2 / 3)
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)

let arr = [3, 1, 4, 1, 5, 9, 2, 6]
stoogeSort(arr, 0, arr.length - 1)
console.log arr

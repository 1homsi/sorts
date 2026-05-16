def quicksort(arr)
    return arr if arr.length <= 1
    let pivot = arr[arr.length >> 1]
    let left = arr.filter do $1 < pivot
    let middle = arr.filter do $1 == pivot
    let right = arr.filter do $1 > pivot
    return [...quicksort(left), ...middle, ...quicksort(right)]

console.log quicksort([3, 6, 8, 10, 1, 2, 1])

const MIN_RUN = 32

def insertionSort arr, left, right
    var i = left + 1
    while i <= right
        let key = arr[i]
        var j = i - 1
        while j >= left and arr[j] > key
            arr[j + 1] = arr[j]
            j--
        arr[j + 1] = key
        i++

def merge arr, left, mid, right
    let lp = arr.slice(left, mid + 1)
    let rp = arr.slice(mid + 1, right + 1)
    var i = 0, j = 0, k = left
    while i < lp.length and j < rp.length
        if lp[i] <= rp[j]
            arr[k++] = lp[i++]
        else
            arr[k++] = rp[j++]
    while i < lp.length do arr[k++] = lp[i++]
    while j < rp.length do arr[k++] = rp[j++]

def timsort arr
    let n = arr.length
    var i = 0
    while i < n
        insertionSort(arr, i, Math.min(i + MIN_RUN - 1, n - 1))
        i += MIN_RUN
    var size = MIN_RUN
    while size < n
        var left = 0
        while left < n
            let mid = Math.min(left + size - 1, n - 1)
            let right = Math.min(left + 2 * size - 1, n - 1)
            if mid < right
                merge(arr, left, mid, right)
            left += 2 * size
        size *= 2
    arr

let arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
console.log timsort(arr)

def flip arr, k
    var left = 0
    var right = k
    while left < right
        var tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left++
        right--

def findMaxIdx arr, size
    var maxIdx = 0
    var i = 1
    while i < size
        if arr[i] > arr[maxIdx]
            maxIdx = i
        i++
    maxIdx

def pancakeSort arr
    var size = arr.length
    while size > 1
        var mi = findMaxIdx(arr, size)
        if mi != size - 1
            flip(arr, mi) if mi != 0
            flip(arr, size - 1)
        size--
    arr

var arr = [3, 6, 2, 7, 4, 1, 5]
console.log(pancakeSort(arr))

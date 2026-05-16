def partition(arr, low, high):
    pivot := arr[high]
    var i = low
    for(high - low) j_off:
        let j = low + j_off
        if arr[j] <= pivot:
            swap(arr, i, j)
            i++
    swap(arr, i, high)
    return i

def swap(arr, i, j):
    let tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp

def quicksort(arr, low, high):
    if low < high:
        let p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)

var arr = [3, 6, 8, 10, 1, 2, 1]
quicksort(arr, 0, arr.length - 1)
print(arr)

def merge(left, right)
    let result = []
    var i = 0, j = 0
    while i < left.length and j < right.length
        if left[i] <= right[j]
            result.push(left[i++])
        else
            result.push(right[j++])
    while i < left.length
        result.push(left[i++])
    while j < right.length
        result.push(right[j++])
    return result

def mergeSort(arr)
    return arr if arr.length <= 1
    let mid = Math.floor(arr.length / 2)
    let left = mergeSort(arr.slice(0, mid))
    let right = mergeSort(arr.slice(mid))
    return merge(left, right)

let arr = [38, 27, 43, 3, 9, 82, 10]
console.log(mergeSort(arr))

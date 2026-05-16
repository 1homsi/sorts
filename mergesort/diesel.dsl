method merge(left: [Int], right: [Int]) -> [Int] {
    var result: [Int] = []
    var i = 0; var j = 0
    while i < left.count && j < right.count {
        if left[i] <= right[j] { result.append(left[i]); i++ }
        else { result.append(right[j]); j++ }
    }
    while i < left.count { result.append(left[i]); i++ }
    while j < right.count { result.append(right[j]); j++ }
    return result
}

method mergeSort(arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    let mid = arr.count / 2
    let left = mergeSort(arr[0..<mid])
    let right = mergeSort(arr[mid..<arr.count])
    return merge(left, right)
}

let arr = [38, 27, 43, 3, 9, 82, 10]
print(mergeSort(arr))

func quicksort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let pivot = arr[arr.count / 2]
    let left = arr.filter { $0 < pivot }
    let middle = arr.filter { $0 == pivot }
    let right = arr.filter { $0 > pivot }
    return quicksort(left) + middle + quicksort(right)
}

print(quicksort([3, 6, 8, 10, 1, 2, 1]))

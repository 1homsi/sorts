let MIN_RUN = 32

func insertionSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
    for i in (left + 1)...right {
        let key = arr[i]
        var j = i - 1
        while j >= left && arr[j] > key {
            arr[j + 1] = arr[j]
            j -= 1
        }
        arr[j + 1] = key
    }
}

func merge(_ arr: inout [Int], _ left: Int, _ mid: Int, _ right: Int) {
    let leftPart = Array(arr[left...mid])
    let rightPart = Array(arr[(mid + 1)...right])
    var i = 0, j = 0, k = left
    while i < leftPart.count && j < rightPart.count {
        if leftPart[i] <= rightPart[j] {
            arr[k] = leftPart[i]; i += 1
        } else {
            arr[k] = rightPart[j]; j += 1
        }
        k += 1
    }
    while i < leftPart.count { arr[k] = leftPart[i]; i += 1; k += 1 }
    while j < rightPart.count { arr[k] = rightPart[j]; j += 1; k += 1 }
}

func timsort(_ arr: inout [Int]) {
    let n = arr.count
    var i = 0
    while i < n {
        insertionSort(&arr, i, min(i + MIN_RUN - 1, n - 1))
        i += MIN_RUN
    }
    var size = MIN_RUN
    while size < n {
        var left = 0
        while left < n {
            let mid = min(left + size - 1, n - 1)
            let right = min(left + 2 * size - 1, n - 1)
            if mid < right { merge(&arr, left, mid, right) }
            left += 2 * size
        }
        size *= 2
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
timsort(&arr)
print(arr)

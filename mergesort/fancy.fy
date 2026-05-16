def merge: left with: right {
    result = []
    i = 0; j = 0
    { i < left size && j < right size } while_true: {
        left[i] <= right[j] if_true: {
            result << left[i]; i = i + 1
        } if_false: {
            result << right[j]; j = j + 1
        }
    }
    { i < left size } while_true: { result << left[i]; i = i + 1 }
    { j < right size } while_true: { result << right[j]; j = j + 1 }
    result
}

def merge_sort: arr {
    arr size <= 1 if_true: { return arr }
    mid = arr size / 2
    left = merge_sort: arr[0, mid]
    right = merge_sort: arr[mid, arr size]
    merge: left with: right
}

arr = [38, 27, 43, 3, 9, 82, 10]
merge_sort: arr . println

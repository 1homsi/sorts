MIN_RUN = 32

def insertion_sort: arr from: left to: right {
    i = left + 1
    { i <= right } whileTrue: {
        key = arr[i]
        j = i - 1
        { j >= left and: { arr[j] > key } } whileTrue: {
            arr[j + 1] = arr[j]
            j = j - 1
        }
        arr[j + 1] = key
        i = i + 1
    }
}

def merge: arr from: left mid: mid to: right {
    lp = arr[left..(mid)] clone
    rp = arr[(mid+1)..(right)] clone
    i = 0; j = 0; k = left
    { i < lp size and: { j < rp size } } whileTrue: {
        lp[i] <= rp[j]
            ifTrue: { arr[k] = lp[i]; i = i + 1 }
            ifFalse: { arr[k] = rp[j]; j = j + 1 }
        k = k + 1
    }
    { i < lp size } whileTrue: { arr[k] = lp[i]; i = i + 1; k = k + 1 }
    { j < rp size } whileTrue: { arr[k] = rp[j]; j = j + 1; k = k + 1 }
}

def timsort: arr {
    n = arr size
    i = 0
    { i < n } whileTrue: {
        right = (i + MIN_RUN - 1) min: n - 1
        insertion_sort: arr from: i to: right
        i = i + MIN_RUN
    }
    size = MIN_RUN
    { size < n } whileTrue: {
        left = 0
        { left < n } whileTrue: {
            mid = (left + size - 1) min: n - 1
            right = (left + 2 * size - 1) min: n - 1
            mid < right ifTrue: { merge: arr from: left mid: mid to: right }
            left = left + 2 * size
        }
        size = size * 2
    }
    arr
}

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
timsort: arr . println

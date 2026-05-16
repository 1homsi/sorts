def isSorted(arr) {
    for (int i = 0; i < arr.size() - 1; i++) {
        if (arr[i] > arr[i + 1]) return false
    }
    return true
}

def bogosort(arr) {
    arr = new ArrayList(arr)
    while (!isSorted(arr)) {
        Collections.shuffle(arr)
    }
    return arr
}

def arr = [3, 1, 4, 1, 5, 9, 2, 6]
println bogosort(arr)

def mergeSort(List arr) {
    if (arr.size() <= 1) return arr
    def mid = arr.size() / 2
    def left = mergeSort(arr[0..<mid])
    def right = mergeSort(arr[mid..<arr.size()])
    return merge(left, right)
}

def merge(List left, List right) {
    def result = []
    def i = 0, j = 0
    while (i < left.size() && j < right.size()) {
        if (left[i] <= right[j]) result << left[i++]
        else result << right[j++]
    }
    while (i < left.size()) result << left[i++]
    while (j < right.size()) result << right[j++]
    return result
}

println mergeSort([38, 27, 43, 3, 9, 82, 10])

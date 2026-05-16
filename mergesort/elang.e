def merge(left, right) {
    var result := []
    var i := 0
    var j := 0
    while (i < left.size() && j < right.size()) {
        if (left[i] <= right[j]) {
            result := result.with(left[i])
            i += 1
        } else {
            result := result.with(right[j])
            j += 1
        }
    }
    while (i < left.size()) {
        result := result.with(left[i])
        i += 1
    }
    while (j < right.size()) {
        result := result.with(right[j])
        j += 1
    }
    result
}

def mergeSort(arr) {
    if (arr.size() <= 1) { return arr }
    def mid := arr.size() // 2
    def left := mergeSort(arr(0, mid))
    def right := mergeSort(arr(mid, arr.size()))
    merge(left, right)
}

def arr := [38, 27, 43, 3, 9, 82, 10]
println(mergeSort(arr))

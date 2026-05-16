class MergeSort {
    static merge(left, right) {
        var result = []
        var i = 0
        var j = 0
        while (i < left.count && j < right.count) {
            if (left[i] <= right[j]) {
                result.add(left[i])
                i = i + 1
            } else {
                result.add(right[j])
                j = j + 1
            }
        }
        while (i < left.count) { result.add(left[i]); i = i + 1 }
        while (j < right.count) { result.add(right[j]); j = j + 1 }
        return result
    }

    static sort(arr) {
        if (arr.count <= 1) return arr
        var mid = (arr.count / 2).floor
        var left = sort(arr[0...mid])
        var right = sort(arr[mid..-1])
        return merge(left, right)
    }
}

var arr = [38, 27, 43, 3, 9, 82, 10]
System.print(MergeSort.sort(arr))

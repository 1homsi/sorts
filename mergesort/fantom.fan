class MergeSort {
    static Int[] merge(Int[] left, Int[] right) {
        result := Int[,]
        i := 0; j := 0
        while (i < left.size && j < right.size) {
            if (left[i] <= right[j]) { result.add(left[i++]) }
            else { result.add(right[j++]) }
        }
        while (i < left.size) result.add(left[i++])
        while (j < right.size) result.add(right[j++])
        return result
    }

    static Int[] mergeSort(Int[] arr) {
        if (arr.size <= 1) return arr
        mid := arr.size / 2
        left := mergeSort(arr[0..<mid])
        right := mergeSort(arr[mid..-1])
        return merge(left, right)
    }

    static Void main() {
        arr := [38, 27, 43, 3, 9, 82, 10]
        echo(mergeSort(arr))
    }
}

class CountingSort {
    static sort(arr) {
        if (arr.count == 0) return arr
        var min = arr[0]
        var max = arr[0]
        for (v in arr) {
            if (v < min) min = v
            if (v > max) max = v
        }
        var range = max - min + 1
        var count = List.filled(range, 0)
        for (v in arr) count[v - min] = count[v - min] + 1
        for (i in 1...range) count[i] = count[i] + count[i - 1]
        var output = List.filled(arr.count, 0)
        var i = arr.count - 1
        while (i >= 0) {
            count[arr[i] - min] = count[arr[i] - min] - 1
            output[count[arr[i] - min]] = arr[i]
            i = i - 1
        }
        return output
    }
}
System.print(CountingSort.sort([4, 2, 2, 8, 3, 3, 1]))

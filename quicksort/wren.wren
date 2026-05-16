class Quicksorter {
    static partition(arr, low, high) {
        var pivot = arr[high]
        var i = low
        var j = low
        while (j < high) {
            if (arr[j] <= pivot) {
                var tmp = arr[i]
                arr[i] = arr[j]
                arr[j] = tmp
                i = i + 1
            }
            j = j + 1
        }
        var tmp = arr[i]
        arr[i] = arr[high]
        arr[high] = tmp
        return i
    }

    static sort(arr, low, high) {
        if (low < high) {
            var p = partition(arr, low, high)
            sort(arr, low, p - 1)
            sort(arr, p + 1, high)
        }
    }
}

var arr = [3, 6, 8, 10, 1, 2, 1]
Quicksorter.sort(arr, 0, arr.count - 1)
System.print(arr)

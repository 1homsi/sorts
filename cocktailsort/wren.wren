class CocktailSort {
    static sort(arr) {
        var swapped = true
        var start = 0
        var end = arr.count - 1
        while (swapped) {
            swapped = false
            for (i in start...end) {
                if (arr[i] > arr[i + 1]) {
                    var tmp = arr[i]
                    arr[i] = arr[i + 1]
                    arr[i + 1] = tmp
                    swapped = true
                }
            }
            if (!swapped) break
            swapped = false
            end = end - 1
            var i = end - 1
            while (i >= start) {
                if (arr[i] > arr[i + 1]) {
                    var tmp = arr[i]
                    arr[i] = arr[i + 1]
                    arr[i + 1] = tmp
                    swapped = true
                }
                i = i - 1
            }
            start = start + 1
        }
        return arr
    }
}

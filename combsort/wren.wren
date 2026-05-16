class CombSort {
    static sort(arr) {
        var n = arr.count
        var gap = n
        var sorted = false
        while (!sorted) {
            gap = (gap / 1.3).floor
            if (gap <= 1) {
                gap = 1
                sorted = true
            }
            for (i in 0...n - gap) {
                if (arr[i] > arr[i + gap]) {
                    var tmp = arr[i]
                    arr[i] = arr[i + gap]
                    arr[i + gap] = tmp
                    sorted = false
                }
            }
        }
        return arr
    }
}

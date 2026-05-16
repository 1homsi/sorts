class ShellSort {
    static sort(arr) {
        var n = arr.count
        var gap = (n / 2).floor
        while (gap > 0) {
            for (i in gap...n) {
                var temp = arr[i]
                var j = i
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap]
                    j = j - gap
                }
                arr[j] = temp
            }
            gap = (gap / 2).floor
        }
        return arr
    }
}

var arr = [64, 34, 25, 12, 22, 11, 90]
System.print(ShellSort.sort(arr))

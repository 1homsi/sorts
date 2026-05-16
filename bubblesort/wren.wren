var bubbleSort = Fn.new { |arr|
    var n = arr.count
    var swapped = true
    while (swapped) {
        swapped = false
        for (i in 0...n-1) {
            if (arr[i] > arr[i+1]) {
                var tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
            }
        }
        n = n - 1
    }
    arr
}

var arr = [64, 34, 25, 12, 22, 11, 90]
System.print(bubbleSort.call(arr))

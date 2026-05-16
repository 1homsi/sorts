[indent=4]
init
    arr: array of int = {64, 34, 25, 12, 22, 11, 90}
    var n = arr.length
    var swapped = true
    while swapped
        swapped = false
        for var i = 0 to (n - 2)
            if arr[i] > arr[i + 1]
                var tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
        n--
    for x in arr
        stdout.printf("%d ", x)
    stdout.printf("\n")

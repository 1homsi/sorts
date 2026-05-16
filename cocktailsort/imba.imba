def cocktailSort(arr)
    var swapped = yes
    var start = 0
    var ending = arr.length - 1
    while swapped
        swapped = no
        for i in [start...ending]
            if arr[i] > arr[i + 1]
                var tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = yes
        break unless swapped
        swapped = no
        ending--
        var i = ending - 1
        while i >= start
            if arr[i] > arr[i + 1]
                var tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = yes
            i--
        start++
    arr

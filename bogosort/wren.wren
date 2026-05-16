import "random" for Random

var isSorted = Fn.new { |arr|
    for (i in 0..arr.count - 2) {
        if (arr[i] > arr[i + 1]) return false
    }
    true
}

var rng = Random.new()

var shuffle = Fn.new { |arr|
    var n = arr.count
    for (i in (n - 1)..1) {
        var j = rng.int(i + 1)
        var tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    }
}

var bogosort = Fn.new { |arr|
    while (!isSorted.call(arr)) {
        shuffle.call(arr)
    }
    arr
}

var arr = [3, 1, 4, 1, 5, 9, 2, 6]
System.print(bogosort.call(arr))

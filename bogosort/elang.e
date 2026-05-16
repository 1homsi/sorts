def isSorted(arr) {
    def n := arr.size()
    var i := 0
    while (i < n - 1) {
        if (arr[i] > arr[i + 1]) { return false }
        i += 1
    }
    true
}

def shuffle(arr) {
    def n := arr.size()
    var result := arr
    for i in (n - 1)..0 {
        def j := entropy.nextInt(i + 1)
        def tmp := result[i]
        result := result.with(i, result[j]).with(j, tmp)
    }
    result
}

def bogosort(arr) {
    var a := arr
    while (!isSorted(a)) {
        a := shuffle(a)
    }
    a
}

def arr := [3, 1, 4, 1, 5, 9, 2, 6]
println(bogosort(arr))

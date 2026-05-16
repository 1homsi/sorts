fn is-sorted {|arr|
    var n = (count $arr)
    for i [(range (- $n 1))] {
        var j = (+ $i 1)
        if (> $arr[$i] $arr[$j]) {
            return $false
        }
    }
    return $true
}

fn shuffle {|arr|
    var a = [$arr[...]]
    var n = (count $a)
    for i [(range (- $n 1) 0 -1)] {
        var j = (randint (+ $i 1))
        var tmp = $a[$i]
        set a[$i] = $a[$j]
        set a[$j] = $tmp
    }
    put $a[...]
}

fn bogosort {|arr|
    var a = [$arr[...]]
    while (not (is-sorted $a)) {
        set a = [(shuffle $a[...])]
    }
    put $a[...]
}

var arr = [3 1 4 1 5 9 2 6]
bogosort $arr[...]

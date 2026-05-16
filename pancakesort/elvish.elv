fn flip {|arr k|
    var left = 0
    var right = $k
    while (< $left $right) {
        var tmp = $arr[$left]
        set arr[$left] = $arr[$right]
        set arr[$right] = $tmp
        set left = (+ $left 1)
        set right = (- $right 1)
    }
}

fn find-max-idx {|arr size|
    var max-idx = 0
    var i = 1
    while (< $i $size) {
        if (> $arr[$i] $arr[$max-idx]) {
            set max-idx = $i
        }
        set i = (+ $i 1)
    }
    put $max-idx
}

fn pancake-sort {|arr|
    var size = (count $arr)
    while (> $size 1) {
        var mi = (find-max-idx $arr $size)
        if (not-eq $mi (- $size 1)) {
            if (not-eq $mi 0) {
                flip $arr $mi
            }
            flip $arr (- $size 1)
        }
        set size = (- $size 1)
    }
    put $arr
}

var arr = [3 6 2 7 4 1 5]
pancake-sort $arr

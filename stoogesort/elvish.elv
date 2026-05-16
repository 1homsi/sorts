fn stooge-sort {|arr first last|
    var a = $arr[$first]
    var b = $arr[$last]
    if (> $a $b) {
        set arr[$first] = $b
        set arr[$last] = $a
    }
    var n = (- (+ $last 1) $first)
    if (> $n 2) {
        var t = (/ (* $n 2) 3)
        stooge-sort $arr $first (- (+ $first $t) 1)
        stooge-sort $arr (+ (- $last $t) 1) $last
        stooge-sort $arr $first (- (+ $first $t) 1)
    }
}

var arr = [3 1 4 1 5 9 2 6]
stooge-sort $arr 0 (- (count $arr) 1)
echo $arr

var min-run = 32

fn insertion-sort {|arr left right|
    var a = $arr
    var i = (+ $left 1)
    while (<= $i $right) {
        var key = $a[$i]
        var j = (- $i 1)
        while (and (>= $j $left) (> $a[$j] $key)) {
            set a[$j + 1] = $a[$j]
            set j = (- $j 1)
        }
        set a[$j + 1] = $key
        set i = (+ $i 1)
    }
    put $a
}

fn merge-runs {|arr left mid right|
    var a = $arr
    var lp = $a[$left..(+ $mid 1)]
    var rp = $a[(+ $mid 1)..(+ $right 1)]
    var i = 0
    var j = 0
    var k = $left
    var ln = (count $lp)
    var rn = (count $rp)
    while (and (< $i $ln) (< $j $rn)) {
        if (<= $lp[$i] $rp[$j]) {
            set a[$k] = $lp[$i]
            set i = (+ $i 1)
        } else {
            set a[$k] = $rp[$j]
            set j = (+ $j 1)
        }
        set k = (+ $k 1)
    }
    while (< $i $ln) {
        set a[$k] = $lp[$i]
        set i = (+ $i 1)
        set k = (+ $k 1)
    }
    while (< $j $rn) {
        set a[$k] = $rp[$j]
        set j = (+ $j 1)
        set k = (+ $k 1)
    }
    put $a
}

fn timsort {|arr|
    var a = $arr
    var n = (count $a)
    var i = 0
    while (< $i $n) {
        var right = (- (+ $i $min-run) 1)
        if (>= $right $n) { set right = (- $n 1) }
        set a = (insertion-sort $a $i $right)
        set i = (+ $i $min-run)
    }
    var size = $min-run
    while (< $size $n) {
        var left = 0
        while (< $left $n) {
            var mid = (- (+ $left $size) 1)
            if (>= $mid $n) { set mid = (- $n 1) }
            var right = (- (+ $left (* 2 $size)) 1)
            if (>= $right $n) { set right = (- $n 1) }
            if (< $mid $right) { set a = (merge-runs $a $left $mid $right) }
            set left = (+ $left (* 2 $size))
        }
        set size = (* $size 2)
    }
    put $a
}

var result = (timsort [5 2 8 1 9 3 7 4 6])
echo (str:join ' ' $result)

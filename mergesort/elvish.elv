fn merge {|left right|
    var result = []
    var i = 0
    var j = 0
    while (and (< $i (count $left)) (< $j (count $right))) {
        if (<= $left[$i] $right[$j]) {
            set result = [$@result $left[$i]]
            set i = (+ $i 1)
        } else {
            set result = [$@result $right[$j]]
            set j = (+ $j 1)
        }
    }
    while (< $i (count $left)) {
        set result = [$@result $left[$i]]
        set i = (+ $i 1)
    }
    while (< $j (count $right)) {
        set result = [$@result $right[$j]]
        set j = (+ $j 1)
    }
    put $result
}

fn merge-sort {|arr|
    var n = (count $arr)
    if (<= $n 1) {
        put $arr
        return
    }
    var mid = (/ $n 2)
    var left = (merge-sort $arr[0..$mid])
    var right = (merge-sort $arr[$mid..])
    merge $left $right
}

var arr = [38 27 43 3 9 82 10]
echo (merge-sort $arr)

fn gnome-sort {|arr|
    var n = (count $arr)
    var i = 0
    while (< $i $n) {
        if (or (== $i 0) (>= $arr[$i] $arr[(- $i 1)])) {
            set i = (+ $i 1)
        } else {
            var tmp = $arr[$i]
            set arr[$i] = $arr[(- $i 1)]
            set arr[(- $i 1)] = $tmp
            set i = (- $i 1)
        }
    }
    put $arr
}

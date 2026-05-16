fn shell-sort {|arr|
    var n = (count $arr)
    var gap = (/ $n 2 | to-string | {|x| printf "%.0f" $x })
    while (> $gap 0) {
        range $gap $n | each {|i|
            var temp = $arr[$i]
            var j = $i
            while (and (>= $j $gap) (> $arr[(- $j $gap)] $temp)) {
                set arr[$j] = $arr[(- $j $gap)]
                set j = (- $j $gap)
            }
            set arr[$j] = $temp
        }
        set gap = (/ $gap 2 | to-string | {|x| printf "%.0f" $x })
    }
    put $arr
}

shell-sort [64 34 25 12 22 11 90]

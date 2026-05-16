fn insertion-sort {|@arr|
    var n = (count $arr)
    for i [(range 1 $n)] {
        var key = $arr[$i]
        var j = (- $i 1)
        while (and (>= $j 0) (> $arr[$j] $key)) {
            set arr[$j+(num 1)] = $arr[$j]
            set j = (- $j 1)
        }
        set arr[$j+(num 1)] = $key
    }
    put $@arr
}

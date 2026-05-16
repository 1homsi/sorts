fn bubble-sort {|@arr|
    var n = (count $arr)
    var swapped = $true
    while $swapped {
        set swapped = $false
        for i [(range 0 (- $n 1))] {
            var j = (+ $i 1)
            if (> $arr[$i] $arr[$j]) {
                var tmp = $arr[$i]
                set arr[$i] = $arr[$j]
                set arr[$j] = $tmp
                set swapped = $true
            }
        }
        set n = (- $n 1)
    }
    put $arr
}

bubble-sort 64 34 25 12 22 11 90

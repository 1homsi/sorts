fn comb-sort {|arr|
    var n = (count $arr)
    var gap = $n
    var sorted = $false
    while (not $sorted) {
        set gap = (num (math:floor (/ $gap 1.3)))
        if (<= $gap 1) {
            set gap = 1
            set sorted = $true
        }
        var i = 0
        while (< (+ $i $gap) $n) {
            if (> $arr[$i] $arr[(+ $i $gap)]) {
                var tmp = $arr[$i]
                set arr[$i] = $arr[(+ $i $gap)]
                set arr[(+ $i $gap)] = $tmp
                set sorted = $false
            }
            set i = (+ $i 1)
        }
    }
    put $@arr
}
